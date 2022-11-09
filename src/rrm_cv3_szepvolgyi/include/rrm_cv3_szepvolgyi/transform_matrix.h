#ifndef TRANSFORM_MATRIX_H
#define TRANSFORM_MATRIX_H

#include <eigen3/Eigen/Dense>
#include <cmath>

namespace matrix {
    Eigen::MatrixXd createRz(double angle);
    Eigen::MatrixXd createRy(double angle);
    Eigen::MatrixXd createTz(double l);
    Eigen::MatrixXd DH(double a,double alpha,double d,double theta);
}

#endif //TRANSFORM_MATRIX_H
