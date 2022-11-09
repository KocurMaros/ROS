#include "rrm_cv3_szepvolgyi/transform_matrix.h"

using namespace Eigen;

namespace matrix {

    MatrixXd createRz(double angle) {
        MatrixXd matrix(4, 4);
        matrix(0, 0) = cos(angle);
        matrix(0, 1) = -sin(angle);
        matrix(0, 2) = 0;
        matrix(0, 3) = 0;
        matrix(1, 0) = sin(angle);
        matrix(1, 1) = cos(angle);
        matrix(1, 2) = 0;
        matrix(1, 3) = 0;
        matrix(2, 0) = 0;
        matrix(2, 1) = 0;
        matrix(2, 2) = 1;
        matrix(2, 3) = 0;
        matrix(3, 0) = 0;
        matrix(3, 1) = 0;
        matrix(3, 2) = 0;
        matrix(3, 3) = 1;
        return matrix;
    }

    MatrixXd createRy(double angle) {
        MatrixXd matrix(4, 4);
        matrix(0, 0) = cos(angle);
        matrix(0, 1) = 0;
        matrix(0, 2) = sin(angle);
        matrix(0, 3) = 0;
        matrix(1, 0) = 0;
        matrix(1, 1) = 1;
        matrix(1, 2) = 0;
        matrix(1, 3) = 0;
        matrix(2, 0) = -sin(angle);
        matrix(2, 1) = 0;
        matrix(2, 2) = cos(angle);
        matrix(2, 3) = 0;
        matrix(3, 0) = 0;
        matrix(3, 1) = 0;
        matrix(3, 2) = 0;
        matrix(3, 3) = 1;
        return matrix;
    }

    MatrixXd createTz(double l) {
        MatrixXd matrix(4, 4);
        matrix(0, 0) = 1;
        matrix(0, 1) = 0;
        matrix(0, 2) = 0;
        matrix(0, 3) = 0;
        matrix(1, 0) = 0;
        matrix(1, 1) = 1;
        matrix(1, 2) = 0;
        matrix(1, 3) = 0;
        matrix(2, 0) = 0;
        matrix(2, 1) = 0;
        matrix(2, 2) = 1;
        matrix(2, 3) = l;
        matrix(3, 0) = 0;
        matrix(3, 1) = 0;
        matrix(3, 2) = 0;
        matrix(3, 3) = 1;
        return matrix;
    }

    MatrixXd DH(double a,double alpha,double d,double theta) {
        MatrixXd matrix(4, 4);
        matrix(0, 0) = cos(theta);
        matrix(0, 1) = -sin(theta)* cos(alpha);
        matrix(0, 2) = sin(theta)* sin(alpha);
        matrix(0, 3) = a*cos(theta);
        matrix(1, 0) = sin(theta);
        matrix(1, 1) = cos(theta)* cos(alpha);
        matrix(1, 2) = -cos(theta)* sin(alpha);
        matrix(1, 3) = a* sin(theta);
        matrix(2, 0) = 0;
        matrix(2, 1) = sin(alpha);
        matrix(2, 2) = cos(alpha);
        matrix(2, 3) = d;
        matrix(3, 0) = 0;
        matrix(3, 1) = 0;
        matrix(3, 2) = 0;
        matrix(3, 3) = 1;
        return matrix;
    }
}
