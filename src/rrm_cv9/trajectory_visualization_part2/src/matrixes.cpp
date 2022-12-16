#include "rrm_cv9/matrixes.h"

using namespace Eigen;

namespace matrixes{

    VectorXd makeM4(float tn, float tn1, float con1, float con2, float con3, float con4) {
        VectorXd vector(4);
        vector << con1, con2, con3, con4;

        MatrixXd m4(4,4);
        m4 <<   1,  pow(tn,1),    pow(tn,2),      pow(tn,3),
                0,  1,                  2*pow(tn,1),    3*pow(tn,2),
                1,  pow(tn1,1),   pow(tn1,2),     pow(tn1,3),
                0,  1,                  2*pow(tn1,1),   3*pow(tn1,2);
        // std::cout << "M1 inverse " << m4 << std::endl;
        vector = (m4.inverse() * vector);

        return vector;
    }
    VectorXd makeM5(float tn, float tn1, float tn2, float con1, float con2, float con3, float con4, float con5) {
        VectorXd vector(5);
        vector << con1, con2, con3, con4, con5;

        MatrixXd m5(5,5);
        m5 <<   1, pow(tn,1), pow(tn,2),   pow(tn,3),   pow(tn,4),
                0, 1,               2*pow(tn,1), 3*pow(tn,2), 4*pow(tn,3),
                1, pow(tn1,1),pow(tn1,2),  pow(tn1,3),  pow(tn1,4),
                1, pow(tn2,1),pow(tn2,2),  pow(tn2,3),  pow(tn2,4),
                0, 1,               2*pow(tn2,1),3*pow(tn2,2),4*pow(tn2,3);
                vector = (m5.inverse() * vector);

        return vector;
    }
    VectorXd makeM6(float tn, float tn1, float tn2, float con1, float con2, float con3, float con4, float con5, float con6) {
        VectorXd vector(6);
        vector << con1, con2, con3, con4, con5, con6;

        MatrixXd m6(6,6);
        m6 <<   1,  pow(tn,1),pow(tn,2),      pow(tn,3),      pow(tn,4),    pow(tn,5),
                0,  1,              2*pow(tn,1),    3*pow(tn,2),    4*pow(tn,3),  5*pow(tn,4),
                1,  pow(tn1,1),pow(tn1,2),    pow(tn1,3),     pow(tn1,4),   pow(tn1,5),
                0,  1,              2*pow(tn1,1),   3*pow(tn1,2),   4*pow(tn1,3), 5*pow(tn1,4),
                1,  pow(tn2,1),pow(tn2,2),    pow(tn2,3),     pow(tn2,4),   pow(tn2,5),
                0,  1,              2*pow(tn2,1),   3*pow(tn2,2),   4*pow(tn2,3), 5*pow(tn2,4);
                vector = (m6.inverse() * vector);

        return vector;
    }


}