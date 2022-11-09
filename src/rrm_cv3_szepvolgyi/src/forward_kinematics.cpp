#include "rrm_cv3_szepvolgyi/forward_kinematics.h"

using namespace matrix;

ForwardKinematics::ForwardKinematics() : position_(0, 0, L1 + L2 + L3 + L4){

    // ROS node handler
    ros::NodeHandle n;

    // Creating subscriber, publisher and service server
    joint_sub_ = n.subscribe("joint_states", 5, &ForwardKinematics::jointCallback, this);

    // Resize joint_state array and initialize with value 0
    joint_state_.position.resize(3, 0);
    orientation_.setRPY(0, 0, 0);
    position_ = tf::Vector3(0,0,0.0);
    orientation2_.setRPY(0, 0, 0);
    position2_ = tf::Vector3(0,0,0.0);
    orientation3_.setRPY(0, 0, 0);
    position3_ = tf::Vector3(0,0,0.0);
    orientation4_.setRPY(0, 0, 0);
    position4_ = tf::Vector3(0,0,0.0);

}

void ForwardKinematics::broadcastTf(){

    //Create transformation, set origin and rotation and finally send
    tf::Transform transform;

    transform.setOrigin( tf::Vector3(0, 0, 0.0));
    tf::Quaternion q;
    q.setRPY(0,0,joint_state_.position[0]);
    transform.setRotation(q);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"base_link", "joint_1"));

//    transform.setOrigin( tf::Vector3(0, 0, 0.203));
//    q.setRPY(0,joint_state_.position[1],0);
//    transform.setRotation(q);
//    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_1", "joint_2"));
//    //Added
//
//    transform.setOrigin( tf::Vector3(0, 0, joint_state_.position[2]+ L2));
//    q.setRPY(0,0,0);
//    transform.setRotation(q);
//    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_2", "joint_3"));

    transform.setOrigin( tf::Vector3(0, 0, 0.178));
    q.setRPY(0,joint_state_.position[3],0);
    transform.setRotation(q);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_3", "joint_4"));

    // Calculated forward kinematic tool0 -> base_link
//    transform.setOrigin( position_ );
//    transform.setRotation(orientation_);
//    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"base_link", "tool0"));

    transform.setOrigin( position4_ );
    transform.setRotation(orientation4_);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"base_link", "tool0"));

    transform.setOrigin( position2_ );
    transform.setRotation(orientation2_);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"base_link", "joint_3"));

    transform.setOrigin( position3_ );
    transform.setRotation(orientation3_);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"base_link", "joint_2"));



    // Links
    transform.setOrigin( tf::Vector3(0, 0, 0.1015));
    q.setRPY(0,0,0);
    transform.setRotation(q);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_1", "link1"));

    transform.setOrigin( tf::Vector3(0, 0, 0.089));
    q.setRPY(0,0,0);
    transform.setRotation(q);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_2", "link2"));
    //Added
    transform.setOrigin( tf::Vector3(0, 0, 0.089));
    q.setRPY(0,0,0);
    transform.setRotation(q);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_3", "link3"));

    transform.setOrigin( tf::Vector3(0, 0, 0.089));
    q.setRPY(0,0,0);
    transform.setRotation(q);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_4", "link4"));

}


void ForwardKinematics::jointCallback(const sensor_msgs::JointState::ConstPtr& msg)
{
    joint_state_ = *msg;

    Eigen::MatrixXd T0 = createRz(joint_state_.position[0]) * createTz(L1) * createRy(joint_state_.position[1])  * createTz(L2)  * createTz(joint_state_.position[2]) * createTz(L3) * createRy(joint_state_.position[3]);
    Eigen::MatrixXd T1 = createRz(joint_state_.position[0]) * createTz(L1) * createRy(joint_state_.position[1]) *  createTz(L2) * createTz(joint_state_.position[2]);
    Eigen::MatrixXd T2 = createRz(joint_state_.position[0]) * createTz(L1) * createRy(joint_state_.position[1]);
//    Eigen::MatrixXd dh = DH(0,0,L1,joint_state_.position[0])*DH(0,joint_state_.position[1],L2,(90*M_PI/180))*DH(0,0,joint_state_.position[2],0)*DH(0,joint_state_.position[3],L4,0);
//    Eigen::MatrixXd dh = DH(0,joint_state_.position[1],L1,joint_state_.position[0]+(90*M_PI/180))*
//            DH(0,0,L2+joint_state_.position[2],0)*
//            DH(0,joint_state_.position[3],L3,0)*
//            DH(0,0,L4,0);
//    Eigen::MatrixXd dh = DH(0,90*M_PI/180,L1,joint_state_.position[0])*
//            DH(0,90*M_PI/180,0,180*M_PI/180+joint_state_.position[1])*
//            DH(0,90*M_PI/180,L3+L2+joint_state_.position[2],180*M_PI/180)*
//            DH(0,0,L4,joint_state_.position[3]);
//    Eigen::MatrixXd dh = DH(0,0,0,joint_state_.position[0])*
//            DH(0,-joint_state_.position[1],L1,0)*
//            DH(0,0,L2+joint_state_.position[2],0)*
//            DH(0,-joint_state_.position[3],L3,0);
    Eigen::MatrixXd dh = DH(0,90*M_PI/180,L1,joint_state_.position[0])*
                         DH(0,-90*M_PI/180,0,-joint_state_.position[1])*
                         DH(0,90*M_PI/180,L3+L2+joint_state_.position[2],0)*
                         DH(0,-90*M_PI/180,0,-joint_state_.position[3]);

    // convert rotation matrix to tf matrix
    tf::Matrix3x3 tf3dDH;
    tf3dDH.setValue(static_cast<double>(dh(0,0)), static_cast<double>(dh(0,1)), static_cast<double>(dh(0,2)),
                  static_cast<double>(dh(1,0)), static_cast<double>(dh(1,1)), static_cast<double>(dh(1,2)),
                  static_cast<double>(dh(2,0)), static_cast<double>(dh(2,1)), static_cast<double>(dh(2,2)));
    tf3dDH.getRotation(orientation4_);
    // Convert to quternion
    tf::Matrix3x3 tf3d;
    tf3d.setValue(static_cast<double>(T1(0,0)), static_cast<double>(T1(0,1)), static_cast<double>(T1(0,2)),
                  static_cast<double>(T1(1,0)), static_cast<double>(T1(1,1)), static_cast<double>(T1(1,2)),
                  static_cast<double>(T1(2,0)), static_cast<double>(T1(2,1)), static_cast<double>(T1(2,2)));
    // Convert to quternion
    tf3d.getRotation(orientation2_);
    tf3d.setValue(static_cast<double>(T2(0,0)), static_cast<double>(T2(0,1)), static_cast<double>(T2(0,2)),
                  static_cast<double>(T2(1,0)), static_cast<double>(T2(1,1)), static_cast<double>(T2(1,2)),
                  static_cast<double>(T2(2,0)), static_cast<double>(T2(2,1)), static_cast<double>(T2(2,2)));
    // Convert to quternion
    tf3d.getRotation(orientation3_);
    tf3d.setValue(static_cast<double>(T0(0,0)), static_cast<double>(T0(0,1)), static_cast<double>(T0(0,2)),
                  static_cast<double>(T0(1,0)), static_cast<double>(T0(1,1)), static_cast<double>(T0(1,2)),
                  static_cast<double>(T0(2,0)), static_cast<double>(T0(2,1)), static_cast<double>(T0(2,2)));
    // Convert to quternion
    tf3d.getRotation(orientation_);

    // Calculate position
    Eigen::MatrixXd p(4,1);
    p(0,0) = 0;
    p(1,0) = 0;
    p(2,0) = L4;
    p(3,0) = 1;

    Eigen::MatrixXd p2(4,1);
    p2(0,0) = 0;
    p2(1,0) = 0;
    p2(2,0) = 0;
    p2(3,0) = 1;

    Eigen::MatrixXd result2 = T1 * p2;
    position2_.setX(result2(0,0));
    position2_.setY(result2(1,0));
    position2_.setZ(result2(2,0));
    Eigen::MatrixXd result3 = T2 * p2;
    position3_.setX(result3(0,0));
    position3_.setY(result3(1,0));
    position3_.setZ(result3(2,0));
    Eigen::MatrixXd result = T0 * p;
    position_.setX(result(0,0));
    position_.setY(result(1,0));
    position_.setZ(result(2,0));
    Eigen::MatrixXd resultTool = dh * p;
    position4_.setX(resultTool(0,0));
    position4_.setY(resultTool(1,0));
    position4_.setZ(resultTool(2,0));

}
