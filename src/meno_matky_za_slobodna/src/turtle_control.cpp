#include "meno_matky_za_slobodna/turtle_control.h"
#include <std_srvs/Empty.h>

TurtleControl::TurtleControl(){

    // NodeHandler
    ros::NodeHandle n;

    // Publisher
    velocity_pub_ = n.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 1);

    // Subscriber
    pose_sub_ = n.subscribe("turtle1/pose", 1, &TurtleControl::poseCallback, this);

    // Service server
    square_service_ = n.advertiseService("/turtle_control/draw", &TurtleControl::drawCallback, this);
    stop_service_ = n.advertiseService("/turtle_control/stop", &TurtleControl::stopCallback, this);
    start_service_ = n.advertiseService("/turtle_control/start", &TurtleControl::startCallback, this);

    // Service client
    teleport_client_ = n.serviceClient<turtlesim::TeleportAbsolute>("/turtle1/teleport_absolute");
    ros::ServiceClient setpen_client = n.serviceClient<turtlesim::SetPen>("/turtle1/set_pen");

    //init variables
    velocity_msg_ = geometry_msgs::Twist();

    //set default pen width
    int width = 1;
    int red,green,blue;

    // get parameters from server
    n.getParam("/turtle_control/line/width", width);
    
    n.getParam("/turtle_control/line/color/red", red);
    n.getParam("/turtle_control/line/color/green", green);
    n.getParam("/turtle_control/line/color/blue", blue);

    // Create service message
    turtlesim::SetPen setpen_srv;
    setpen_client.waitForExistence();
    
    setpen_srv.request.width = width;
    setpen_srv.request.off = false;
    setpen_srv.request.r = red;
    setpen_srv.request.g = green;
    setpen_srv.request.b = blue;

    // Call service
    if (setpen_client.call(setpen_srv)){
        ROS_WARN("Ciara bola uspesne nastavena");
    }

    //variable init
    this->drawing_status_ = false;
    this->pose_msg_ = turtlesim::Pose();
}
bool TurtleControl::startCallback(meno_matky_za_slobodna::Start::Request &req, meno_matky_za_slobodna::Start::Response &res){
    velocity_msg_.linear.x = speed;
    velocity_msg_.linear.y = 0;
    velocity_msg_.linear.z = 0;

    velocity_msg_.angular.x = 0;
    velocity_msg_.angular.y = 0;
    velocity_msg_.angular.z = angle;
    this->drawing_status_ = true;

    res.success = true;
    return true;
}
bool TurtleControl::stopCallback(meno_matky_za_slobodna::Stop::Request &req, meno_matky_za_slobodna::Stop::Response &res){
    velocity_msg_.linear.x = 0;
    velocity_msg_.linear.y = 0;
    velocity_msg_.linear.z = 0;

    velocity_msg_.angular.x = 0;
    velocity_msg_.angular.y = 0;
    velocity_msg_.angular.z = 0;
    this->drawing_status_ = false;

    res.success = true;
    return true;
}
// service server callback for starting the drawing and drawing speed configuration
bool TurtleControl::drawCallback(meno_matky_za_slobodna::Draw::Request &req, meno_matky_za_slobodna::Draw::Response &res)
{   
    speed = (float)req.speed;
    angle = (float)req.radius;
    angle = speed/angle;

    velocity_msg_.linear.x = speed;
    velocity_msg_.linear.y = 0;
    velocity_msg_.linear.z = 0;

    velocity_msg_.angular.x = 0;
    velocity_msg_.angular.y = 0;
    velocity_msg_.angular.z = angle;
    this->drawing_status_ = true;

    res.success = true;
    return true;
}

// topic callback a for listening to the pose message from the turtle
void TurtleControl::poseCallback(const turtlesim::Pose::ConstPtr& msg)
{    
    ros::NodeHandle n;
    ros::ServiceClient clearClient = n.serviceClient<std_srvs::Empty>("/clear");
    std_srvs::Empty srv;
    if ((msg->x >= WINDOW_EDGE)||(msg->y >= WINDOW_EDGE)||(msg->x <= 0)||(msg->y <= 0))
    {
        velocity_msg_.linear.x = 0;
        velocity_msg_.linear.y = 0;
        velocity_msg_.linear.z = 0;

        velocity_msg_.angular.x = 0;
        velocity_msg_.angular.y = 0;
        velocity_msg_.angular.z = 0;

        this->drawing_status_ = false;
        publish();
        turtlesim::TeleportAbsolute teleport_srv;
        teleport_srv.request.theta = 0;
        teleport_srv.request.x = WINDOW_CENTER;
        teleport_srv.request.y = WINDOW_CENTER;
        teleport_client_.call(teleport_srv);       
        clearClient.call(srv);
    }
    this->pose_msg_ = *msg;


}

// publishing the configured velocity
void TurtleControl::publish()
{
    velocity_pub_.publish(velocity_msg_);
}

//frequency setup
double TurtleControl::getRate()
{
    return PUB_RATE;
}

//getter if drawing is enabled or not
bool TurtleControl::getDrawingStatus()
{
    return this->drawing_status_;
}
