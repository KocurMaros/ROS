#include "meno_matky_za_slobodna/turtle_control.h"

TurtleControl::TurtleControl(){

    // NodeHandler
    ros::NodeHandle n;

    // Publisher
    velocity_pub_ = n.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 1);

    // Subscriber
    pose_sub_ = n.subscribe("turtle1/pose", 1, &TurtleControl::poseCallback, this);

    // Service server
    square_service_ = n.advertiseService("/turtle_control/draw", &TurtleControl::drawCallback, this);

    // Service client
    teleport_client_ = n.serviceClient<turtlesim::TeleportAbsolute>("/turtle1/teleport_absolute");
    ros::ServiceClient setpen_client = n.serviceClient<turtlesim::SetPen>("/turtle1/set_pen");

    //init variables
    velocity_msg_ = geometry_msgs::Twist();

    //set default pen width
    int width = 1;

    // get parameters from server
    n.getParam("/turtle_control/line/width", width);

    // Create service message
    turtlesim::SetPen setpen_srv;
    setpen_client.waitForExistence();
    setpen_srv.request.width = width;
    setpen_srv.request.off = false;

    // Call service
    if (setpen_client.call(setpen_srv)){
        ROS_WARN("Ciara bola uspesne nastavena");
    }

    //variable init
    this->drawing_status_ = false;
    this->pose_msg_ = turtlesim::Pose();
}

// service server callback for starting the drawing and drawing speed configuration
bool TurtleControl::drawCallback(meno_matky_za_slobodna::Draw::Request &req, meno_matky_za_slobodna::Draw::Response &res)
{
    int64_t speed = req.speed;
    int64_t angle;
    angle = speed/(req.radius);
    // printf("co do pici\n");
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
    if ((msg->x >= WINDOW_EDGE)||(msg->y >= WINDOW_EDGE)||(msg->x <= 0)||(msg->y <= 0))
    {
        turtlesim::TeleportAbsolute teleport_srv;
        teleport_srv.request.theta = 0;
        teleport_srv.request.x = WINDOW_CENTER;
        teleport_srv.request.y = WINDOW_CENTER;
        
        this->drawing_status_ = false;
        teleport_client_.call(teleport_srv);
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
