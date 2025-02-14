#include "rrm_cv3_kocur/transform_matrix.h"

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
    MatrixXd DH(double a, double alfa, double d, double teta) {
        MatrixXd matrix(4, 4);
        matrix(0, 0) = cos(teta);
        matrix(0, 1) = -sin(teta)*cos(alfa);
        matrix(0, 2) = sin(teta)*sin(alfa);
        matrix(0, 3) = a*cos(teta);
        matrix(1, 0) = sin(teta);
        matrix(1, 1) = cos(teta)*cos(alfa);
        matrix(1, 2) = -cos(teta)*sin(alfa);
        matrix(1, 3) = a*sin(teta);
        matrix(2, 0) = 0;
        matrix(2, 1) = sin(alfa);
        matrix(2, 2) = cos(alfa);
        matrix(2, 3) = d;
        matrix(3, 0) = 0;
        matrix(3, 1) = 0;
        matrix(3, 2) = 0;
        matrix(3, 3) = 1;
        return matrix;
    }
}
