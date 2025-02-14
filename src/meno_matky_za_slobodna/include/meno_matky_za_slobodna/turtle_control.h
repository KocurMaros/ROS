#ifndef PROJECT_TURTLECONTROL_H
#define PROJECT_TURTLECONTROL_H

// Include ros base
#include <ros/ros.h>

//Include ros msgs
#include <geometry_msgs/Twist.h>
#include <turtlesim/Pose.h>
#include <turtlesim/TeleportAbsolute.h>
#include <turtlesim/SetPen.h>
#include <meno_matky_za_slobodna/Draw.h>
#include <meno_matky_za_slobodna/Start.h>
#include <meno_matky_za_slobodna/Stop.h>

//main class for turtle control
class TurtleControl {

public:
    //Constructor
    TurtleControl();

    //Callbacks
    bool drawCallback(meno_matky_za_slobodna::Draw::Request &req, meno_matky_za_slobodna::Draw::Response &res);
    bool startCallback(meno_matky_za_slobodna::Start::Request &req, meno_matky_za_slobodna::Start::Response &res);
    bool stopCallback(meno_matky_za_slobodna::Stop::Request &req, meno_matky_za_slobodna::Stop::Response &res);
    void poseCallback(const turtlesim::Pose::ConstPtr& msg);

    // Other public methods
    void setupDrawing();
    void publish();
    double getRate();
    bool getDrawingStatus();

private:

    // Consts
    const double PUB_RATE = 100.0;
    const double  WINDOW_CENTER = 5.544444561;
    const double WINDOW_EDGE = 11.088889122;
    
    float speed;
    float angle;
    // member variables
    geometry_msgs::Twist velocity_msg_;
    bool drawing_status_;
    turtlesim::Pose pose_msg_;

    //ROS communication tools
    ros::Publisher velocity_pub_;
    ros::Subscriber pose_sub_;
    ros::ServiceServer square_service_;
    ros::ServiceServer stop_service_;
    ros::ServiceServer start_service_;
    ros::ServiceClient teleport_client_;

};


#endif //PROJECT_TURTLECONTROL_H