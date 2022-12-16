#ifndef IK_SOLVER_H
#define IK_SOLVER_H
#include "IK_Solver.h"

#include <ros/ros.h>
#include <Eigen/Geometry>
#include <eigen_conversions/eigen_msg.h>
#include <moveit/robot_model_loader/robot_model_loader.h>

namespace iksolver {

    std::vector<std::vector<double>> IKsolver(double x, double y, double z, double rx, double ry, double rz);

}

#endif