//
// Created by david on 5.12.2022.
//
#include <ros/ros.h>

#include <Eigen/Core>
#include <Eigen/Geometry>
#include <moveit_msgs/DisplayTrajectory.h>
#include <cmath>
#include <fstream>
#include <ros/ros.h>
#include <eigen_conversions/eigen_msg.h>
#include <moveit/robot_model_loader/robot_model_loader.h>

Eigen::VectorXd MatrixMaker4(float tn, float tn1, float con1, float con2, float con3, float con4);
Eigen::VectorXd MatrixMaker5(float tn, float tn1, float tn2, float con1, float con2, float con3, float con4, float con5);
Eigen::VectorXd MatrixMaker6(float tn, float tn1, float tn2, float con1, float con2, float con3, float con4, float con5, float con6);

std::vector<std::vector<double>> IKEAsolver(double x, double y, double z, double rx, double ry, double rz);

int main(int argc, char **argv)
{
    std::ofstream myfile;
    myfile.open ("example.txt");
    // Vytvorenie node a publishera
    ros::init(argc, argv, "trajectory_visualization_part2");
    ros::NodeHandle n;
    ros::Publisher publisher = n.advertise<moveit_msgs::DisplayTrajectory>("trajectory", 1);
    std::vector<std::vector<double>> solutions;
    Eigen::VectorXd solution_final(6);
    solution_final << 0,0,0,0,0,0;
    // Sprava pre trajektoriu
    moveit_msgs::RobotTrajectory trajectory;
    // Mena klbov musia byt vyplnene
    trajectory.joint_trajectory.joint_names = {"joint_1", "joint_2", "joint_3", "joint_4", "joint_5", "joint_6"};

    float A1[6] = {0, 0, 0, 0, 0, 0};
    float A3[9] = {0, 0, 0, 0, 0, 0, 0, 0, 0};

    Eigen::VectorXd U1 = MatrixMaker4(0,1,1.6,0,1,0);
    Eigen::VectorXd U2 = MatrixMaker4(1,2,0,0,M_PI/2,0);
    Eigen::VectorXd U3 = MatrixMaker5(3,4,5,0,0,0.5,0.5,0);
    Eigen::VectorXd U4 = MatrixMaker5(3,4,5,1,0,1,1.6,0);
    Eigen::VectorXd U5 = MatrixMaker6(3,4,5,M_PI/2,0,M_PI/2,0,0,0);
    Eigen::VectorXd U6 = MatrixMaker4(5,9,0.5,0,0,0);

    Eigen::MatrixXd matrixIK(9,6);
    double tool_position_rz, tool_position_y, tool_position_z;
    double tool_velo_rz, tool_velo_y, tool_velo_z;
    double tool_acce_rz, tool_acce_y, tool_acce_z;  
  
    for (double t = 0; t <= 9; t += 0.05) {

        matrixIK <<   1,0,U1(0)+U1(1)*pow(t,1)+U1(2)*pow(t,2)+U1(3)*pow(t,3),0,M_PI/2,0,
                  1,0,1,0,M_PI/2,U2(0)+U2(1)*pow(t,1)+U2(2)*pow(t,2)+U2(3)*pow(t,3),
                  1,0,1,0,M_PI/2,M_PI/2,
                  1,U3(0)+U3(1)*pow(t,1)+U3(2)*pow(t,2)+U3(3)*pow(t,3)+U3(4)*pow(t,4),U4(0)+U4(1)*pow(t,1)+U4(2)*pow(t,2)+U4(3)*pow(t,3)+U4(4)*pow(t,4),0,M_PI/2,U5(0)+U5(1)*pow(t,1)+U5(2)*pow(t,2)+U5(3)*pow(t,3)+U5(4)*pow(t,4)+U5(5)*pow(t,5),
                  1,U3(0)+U3(1)*pow(t,1)+U3(2)*pow(t,2)+U3(3)*pow(t,3)+U3(4)*pow(t,4),U4(0)+U4(1)*pow(t,1)+U4(2)*pow(t,2)+U4(3)*pow(t,3)+U4(4)*pow(t,4),0,M_PI/2,U5(0)+U5(1)*pow(t,1)+U5(2)*pow(t,2)+U5(3)*pow(t,3)+U5(4)*pow(t,4)+U5(5)*pow(t,5),
                  1,U6(0)+U6(1)*pow(t,1)+U6(2)*pow(t,2)+U6(3)*pow(t,3),1.6,0,M_PI/2,0,
                  1,U6(0)+U6(1)*pow(t,1)+U6(2)*pow(t,2)+U6(3)*pow(t,3),1.6,0,M_PI/2,0,
                  1,U6(0)+U6(1)*pow(t,1)+U6(2)*pow(t,2)+U6(3)*pow(t,3),1.6,0,M_PI/2,0,
                  1,U6(0)+U6(1)*pow(t,1)+U6(2)*pow(t,2)+U6(3)*pow(t,3),1.6,0,M_PI/2,0;
        // ROS_INFO_STREAM("matrixIK:\n" << matrixIK);

        solutions = IKEAsolver(matrixIK(t-0.04,0),matrixIK(t-0.04,1),matrixIK(t-0.04,2),matrixIK(t-0.04,3),matrixIK(t-0.04,4),matrixIK(t-0.04,5));

        double actual_sum =0, best_sum = 0;
        int best_sum_pos = 0;
        for (int i=0; i<solutions.size();i++) {
            for (int j=0; j<6;j++) 
                actual_sum += abs(abs(solutions[i][j]) - abs(solution_final(j)));
            if(i == 0)
                best_sum = actual_sum;
            else if (actual_sum < best_sum){
                best_sum = actual_sum;
                best_sum_pos = i;
            }
            actual_sum = 0;
        }
        solution_final << solutions[best_sum_pos][0],solutions[best_sum_pos][1],solutions[best_sum_pos][2],solutions[best_sum_pos][3],solutions[best_sum_pos][4],solutions[best_sum_pos][5];
        
        // Vytvorenie prejazdoveho bodu
        trajectory_msgs::JointTrajectoryPoint point;

        // Robot ma 6 klbov
        point.positions.resize(6);

        // Klb 1
        point.positions[0] = solution_final(0);

        // Klb 2
        point.positions[1] = solution_final(1);

        // Klb 3
        point.positions[2] = solution_final(2);

        // Klb 4
        point.positions[3] = solution_final(3);

        // Klb 5
        point.positions[4] = solution_final(4);

        // Klb 6
        point.positions[5] = solution_final(5);

        // Vlozenie casu prejazdu
        point.time_from_start = ros::Duration(t);

        // VLozenie bodu do trajektorie
        trajectory.joint_trajectory.points.push_back(point);
        
        if(t<=1){
            tool_position_rz = 0;
            tool_velo_rz = 0; 
            tool_acce_rz = 0;

            tool_position_y = 0; 
            tool_velo_y = 0;
            tool_acce_y = 0;

            tool_position_z = U1(0)+U1(1)*pow(t,1)+U1(2)*pow(t,2)+U1(3)*pow(t,3);
            tool_velo_z = U1(1)+2*U1(2)*t+3*U1(3)*pow(t,2);
            tool_acce_z = 2*U1(2)+6*U1(3)*t;  
        }else if(t<=2){
            tool_position_rz = U2(0)+U2(1)*pow(t,1)+U2(2)*pow(t,2)+U2(3)*pow(t,3);
            tool_velo_rz = U2(1)+2*U2(2)*t+3*U2(3)*pow(t,2); 
            tool_acce_rz = 2*U2(2)+6*U2(3)*t; ;

            tool_position_y = 0; 
            tool_velo_y = 0;
            tool_acce_y = 0;

            tool_position_z = 0;
            tool_velo_z = 1;
            tool_acce_z = 0;  
        }else if(t<=3){
            tool_position_rz = M_PI/2;
            tool_velo_rz = 0; 
            tool_acce_rz = 0;

            tool_position_y = 0; 
            tool_velo_y = 0;
            tool_acce_y = 0;

            tool_position_z = 0;
            tool_velo_z = 1;
            tool_acce_z = 0;  
        }else if(t<=5){
            tool_position_rz = U5(0)+U5(1)*pow(t,1)+U5(2)*pow(t,2)+U5(3)*pow(t,3)+U5(4)*pow(t,4)+U5(5)*pow(t,5);
            tool_velo_rz = U5(1)+2*U5(2)*t+3*U5(3)*pow(t,2)+4*U5(4)*pow(t,3)+5*U5(5)*pow(t,4); 
            tool_acce_rz = 2*U5(2)+6*U5(3)*t+12*U5(4)*pow(t,2)+20*U5(5)*pow(t,3);

            tool_position_y = U3(0)+U3(1)*pow(t,1)+U3(2)*pow(t,2)+U3(3)*pow(t,3)+U3(4)*pow(t,4); 
            tool_velo_y = U3(1)+2*U3(2)*t+3*U3(3)*pow(t,2)+4*U3(4)*pow(t,3);
            tool_acce_y = U3(2)+3*U3(3)*t+12*U3(4)*pow(t,2);

            tool_position_z = U4(0)+U4(1)*pow(t,1)+U4(2)*pow(t,2)+U4(3)*pow(t,3)+U4(4)*pow(t,4);
            tool_velo_z = U4(1)+2*U4(2)*t+3*U4(3)*pow(t,2)+4*U4(4)*pow(t,3);
            tool_acce_z = 2*U4(2)+6*U4(3)*t+12*U4(4)*pow(t,2);   
        }else{
            tool_position_rz = 0;
            tool_velo_rz = 0; 
            tool_acce_rz = 0;

            tool_position_y = U6(0)+U6(1)*pow(t,1)+U6(2)*pow(t,2)+U6(3)*pow(t,3); 
            tool_velo_y = U6(1)+2*U6(2)*t+3*U6(3)*pow(t,2);
            tool_acce_y = 2*U6(2)+6*U6(3)*t;

            tool_position_z = 0;
            tool_velo_z = 1.6;
            tool_acce_z = 0;  
        }
        std::cout << t << " " << tool_position_y << " " << tool_velo_y << " " << tool_acce_y << endl;
        myfile << t << ";";
        myfile << tool_position_y << ";";
        myfile << tool_velo_y << ";";
        myfile << tool_acce_y << ";";
        myfile << tool_position_z << ";";
        myfile << tool_velo_z << ";";
        myfile << tool_acce_z << ";";
        myfile << tool_position_rz << ";";
        myfile << tool_velo_rz << ";";
        myfile << tool_acce_rz << ";";
        myfile << "\n";
    }
    myfile.close();

    // Sprava pre vizualizaciu
    moveit_msgs::DisplayTrajectory display_trajectory;

    // Potrebne vyplnit nazov modelu
    display_trajectory.model_id = "abb_irb";

    // Vlozenie vypocitanej trajektorie
    display_trajectory.trajectory.push_back(trajectory);

    // Publikuj trajektoriu kazde 2 sekundy
    ros::Rate loop_rate(0.5);
    while (ros::ok()) {
        publisher.publish(display_trajectory);
        loop_rate.sleep();
    }
    return 0;
}
Eigen::VectorXd MatrixMaker4(float tn, float tn1, float con1, float con2, float con3, float con4) {
    Eigen::VectorXd vector(4);
    vector << con1, con2, con3, con4;

    Eigen::MatrixXd m4(4,4);
    m4 <<   1,  pow(tn,1),    pow(tn,2),      pow(tn,3),
            0,  1,                  2*pow(tn,1),    3*pow(tn,2),
            1,  pow(tn1,1),   pow(tn1,2),     pow(tn1,3),
            0,  1,                  2*pow(tn1,1),   3*pow(tn1,2);
    vector = (m4.inverse() * vector);

    return vector;
}
Eigen::VectorXd MatrixMaker5(float tn, float tn1, float tn2, float con1, float con2, float con3, float con4, float con5) {
    Eigen::VectorXd vector(5);
    vector << con1, con2, con3, con4, con5;

    Eigen::MatrixXd m5(5,5);
    m5 <<   1, pow(tn,1), pow(tn,2),   pow(tn,3),   pow(tn,4),
            0, 1,               2*pow(tn,1), 3*pow(tn,2), 4*pow(tn,3),
            1, pow(tn1,1),pow(tn1,2),  pow(tn1,3),  pow(tn1,4),
            1, pow(tn2,1),pow(tn2,2),  pow(tn2,3),  pow(tn2,4),
            0, 1,               2*pow(tn2,1),3*pow(tn2,2),4*pow(tn2,3);
            vector = (m5.inverse() * vector);

    return vector;
}
Eigen::VectorXd MatrixMaker6(float tn, float tn1, float tn2, float con1, float con2, float con3, float con4, float con5, float con6) {
    Eigen::VectorXd vector(6);
    vector << con1, con2, con3, con4, con5, con6;

    Eigen::MatrixXd m6(6,6);
    m6 <<   1,  pow(tn,1),pow(tn,2),      pow(tn,3),      pow(tn,4),    pow(tn,5),
            0,  1,              2*pow(tn,1),    3*pow(tn,2),    4*pow(tn,3),  5*pow(tn,4),
            1,  pow(tn1,1),pow(tn1,2),    pow(tn1,3),     pow(tn1,4),   pow(tn1,5),
            0,  1,              2*pow(tn1,1),   3*pow(tn1,2),   4*pow(tn1,3), 5*pow(tn1,4),
            1,  pow(tn2,1),pow(tn2,2),    pow(tn2,3),     pow(tn2,4),   pow(tn2,5),
            0,  1,              2*pow(tn2,1),   3*pow(tn2,2),   4*pow(tn2,3), 5*pow(tn2,4);
            vector = (m6.inverse() * vector);

    return vector;
}
std::vector<std::vector<double>> IKEAsolver(double x, double y, double z, double rx, double ry, double rz) {
    ros::NodeHandle n;
    //x,Eigen::VectorXd y,Eigen::VectorXd z,Eigen::VectorXd dx,Eigen::VectorXd dy, Eigen::VectorXd dz

    // Vytvorenie modelu z urdf
    robot_model_loader::RobotModelLoader loader("robot_description");

    // Vyber move group a IK algoritmu
    robot_state::JointModelGroup* joint_model_group = loader.getModel()->getJointModelGroup("robot");
    const kinematics::KinematicsBaseConstPtr& solver = joint_model_group->getSolverInstance();


    // Vytvorenie cielovej polohy x, y, z, rx, ry, rz.
    Eigen::Affine3d target = Eigen::Translation3d(Eigen::Vector3d(x, y, z))*
                             Eigen::AngleAxisd(rx,Eigen::Vector3d::UnitX())*
                             Eigen::AngleAxisd(ry,Eigen::Vector3d::UnitY())*
                             Eigen::AngleAxisd(rz,Eigen::Vector3d::UnitZ());

    // Konverzia z Eigen do geometry_msgs
    geometry_msgs::Pose target_msg;
    tf::poseEigenToMsg(target, target_msg);

    // Premenne vystupujuce vo funkcii getPositionIK
    std::vector<geometry_msgs::Pose> ik_poses = {target_msg};   // Vlozenie cielu do pola
    std::vector<std::vector<double> > solutions;                // Vystup z funkcie s mnozinou rieseni
    std::vector<double> ik_seed_state = {0,0,0,0,0,0};          // Odhadovane riesenie - potrebne iba pre analyticke algoritmy
    kinematics::KinematicsResult result;                        // exit_code z funkcie (ci bol vypocet uspesny)

    // Vypocet inverznej kinematiky
    solver->getPositionIK(ik_poses,ik_seed_state, solutions, result, kinematics::KinematicsQueryOptions());

    // Overenie ci bol vypocet uspesny
    if (result.kinematic_error != kinematics::KinematicError::OK) {
        throw std::runtime_error("Unable to compute IK. Error: " + std::to_string(result.kinematic_error));
    }

    // Vypis riesenii
    for (const auto &solution: solutions) {
        // ROS_INFO("Solution found: ");
        for (const auto &joint : solution) {
            // ROS_INFO_STREAM(std::to_string(joint));
        }
    }

    return solutions;
}