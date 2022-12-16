#ifndef MATRIXES_H
#define MATRIXES_H

#include "matrixes.h"

#include <Eigen/Core>
#include <Eigen/Geometry>
#include <eigen3/Eigen/Dense>
#include <cmath>
#include <eigen_conversions/eigen_msg.h>


namespace matrixes {
    Eigen::VectorXd makeM4(float tn, float tn1, float con1, float con2, float con3, float con4);
    Eigen::VectorXd makeM5(float tn, float tn1, float tn2, float con1, float con2, float con3, float con4, float con5);
    Eigen::VectorXd makeM6(float tn, float tn1, float tn2, float con1, float con2, float con3, float con4, float con5, float con6);
}   

#endif