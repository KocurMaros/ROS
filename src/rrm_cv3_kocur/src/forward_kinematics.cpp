#include "rrm_cv3_kocur/forward_kinematics.h"

using namespace matrix;

ForwardKinematics::ForwardKinematics() : position_(0, 0, L1 + L2 + L3 + L4){

    // ROS node handler
    ros::NodeHandle n;

    // Creating subscriber, publisher and service server
    joint_sub_ = n.subscribe("joint_states", 5, &ForwardKinematics::jointCallback, this);

    // Resize joint_state array and initialize with value 0
    joint_state_.position.resize(3, 0);
    orientation_.setRPY(0,0,0);
    position_ = tf::Vector3(0,0,0.0);
    orientation1_.setRPY(0,0,0);
    position1_ = tf::Vector3(0,0,0.0);
    orientation2_.setRPY(0,0,0);
    position2_ = tf::Vector3(0,0,0.0);
    orientation3_.setRPY(0,0,0);
    position3_ = tf::Vector3(0,0,0.0);
}

void ForwardKinematics::broadcastTf(){

    //Create transformation, set origin and rotation and finally send
    tf::Transform transform;

    transform.setOrigin( tf::Vector3(0, 0, 0));
    tf::Quaternion q;
    q.setRPY(0,0,joint_state_.position[0]);
    transform.setRotation(q);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"base_link", "joint_1"));
    
    // transform.setOrigin( tf::Vector3(0, 0, 0.203));
    // q.setRPY(0,joint_state_.position[1],0);
    // transform.setRotation(q);
    // broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_1", "joint_2"));

    // transform.setOrigin( tf::Vector3(0, 0, 0.178 +joint_state_.position[2]));
    // q.setRPY(0,0,0);
    // transform.setRotation(q);
    // broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_2", "joint_3"));

    transform.setOrigin( tf::Vector3(0, 0, 0.178));
    q.setRPY(0,joint_state_.position[3],0);
    transform.setRotation(q);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_3", "joint_4"));

    // Calculated forward kinematic tool0 -> base_link
    // transform.setOrigin( position_ );
    // transform.setRotation(orientation_);
    // broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"base_link", "tool0"));

    transform.setOrigin( position1_ );
    transform.setRotation(orientation1_);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"base_link", "joint_2"));

    transform.setOrigin( position2_ );
    transform.setRotation(orientation2_);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"base_link", "joint_3"));
    
    transform.setOrigin( position3_ );
    transform.setRotation(orientation3_);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"base_link", "tool0"));
    // Links
    transform.setOrigin( tf::Vector3(0, 0, 0.1015));
    q.setRPY(0,0,0);
    transform.setRotation(q);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_1", "link1"));

    transform.setOrigin( tf::Vector3(0, 0, 0.089));
    q.setRPY(0,0,0);
    transform.setRotation(q);
    broadcaster_.sendTransform(tf::StampedTransform(transform, ros::Time::now(),"joint_2", "link2"));

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

    Eigen::MatrixXd T0 = createRz(joint_state_.position[0]) * createTz(L1) * createRy(joint_state_.position[1]) * createTz(L2) * createTz(joint_state_.position[2])* createTz(L3)* createRy(joint_state_.position[3]);
    Eigen::MatrixXd J2 = createRz(joint_state_.position[0]) * createTz(L1) * createRy(joint_state_.position[1]) ;
    Eigen::MatrixXd J3 = createRz(joint_state_.position[0]) * createTz(L1) * createRy(joint_state_.position[1]) * createTz(L2) * createTz(joint_state_.position[2]);
    Eigen::MatrixXd dh = DH(0,M_PI/2,L1,joint_state_.position[0])*
                         DH(0,-M_PI/2,0,-joint_state_.position[1])*
                         DH(0,90*M_PI/180,L3+L2+joint_state_.position[2],0)*
                         DH(0,-90*M_PI/180,0,-joint_state_.position[3]);
    
    // convert rotation matrix to tf matrix
    tf::Matrix3x3 tf3d;
    tf::Matrix3x3 tf3d_to_joint2;
    tf::Matrix3x3 tf3d_to_joint3;
    tf::Matrix3x3 tf3d_dh;


    tf3d.setValue(static_cast<double>(T0(0,0)), static_cast<double>(T0(0,1)), static_cast<double>(T0(0,2)),
                  static_cast<double>(T0(1,0)), static_cast<double>(T0(1,1)), static_cast<double>(T0(1,2)),
                  static_cast<double>(T0(2,0)), static_cast<double>(T0(2,1)), static_cast<double>(T0(2,2)));
    tf3d.getRotation(orientation_);
    tf3d_to_joint2.setValue(static_cast<double>(J2(0,0)), static_cast<double>(J2(0,1)), static_cast<double>(J2(0,2)),
                  static_cast<double>(J2(1,0)), static_cast<double>(J2(1,1)), static_cast<double>(J2(1,2)),
                  static_cast<double>(J2(2,0)), static_cast<double>(J2(2,1)), static_cast<double>(J2(2,2)));
    tf3d_to_joint2.getRotation(orientation1_);
    tf3d_to_joint3.setValue(static_cast<double>(J3(0,0)), static_cast<double>(J3(0,1)), static_cast<double>(J3(0,2)),
                  static_cast<double>(J3(1,0)), static_cast<double>(J3(1,1)), static_cast<double>(J3(1,2)),
                  static_cast<double>(J3(2,0)), static_cast<double>(J3(2,1)), static_cast<double>(J3(2,2)));
    tf3d_to_joint3.getRotation(orientation2_);
    tf3d_dh.setValue(static_cast<double>(dh(0,0)), static_cast<double>(dh(0,1)), static_cast<double>(dh(0,2)),
                static_cast<double>(dh(1,0)), static_cast<double>(dh(1,1)), static_cast<double>(dh(1,2)),
                static_cast<double>(dh(2,0)), static_cast<double>(dh(2,1)), static_cast<double>(dh(2,2)));
    tf3d_dh.getRotation(orientation3_);

    // Convert to quternion
    // Calculate position
    Eigen::MatrixXd p(4,1);
    p(0,0) = 0;
    p(1,0) = 0;
    p(2,0) = L4;
    p(3,0) = 1;
    Eigen::MatrixXd p1(4,1);
    p1(0,0) = 0;
    p1(1,0) = 0;
    p1(2,0) = 0;
    p1(3,0) = 1;

    Eigen::MatrixXd result;
    result = T0 * p;
    position_.setX(result(0,0));
    position_.setY(result(1,0));
    position_.setZ(result(2,0));

    result = J2 * p1;
    position1_.setX(result(0,0));
    position1_.setY(result(1,0));
    position1_.setZ(result(2,0));

    result = J3 * p1;
    position2_.setX(result(0,0));
    position2_.setY(result(1,0));
    position2_.setZ(result(2,0));

    result = dh * p;
    position3_.setX(result(0,0));
    position3_.setY(result(1,0));
    position3_.setZ(result(2,0));
}
