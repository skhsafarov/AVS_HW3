#include <math.h>
double ArcCos(double x)
{
    int n = 0;
    double res = 0;
    double y = x * x;
    do
    {
        res += x;
        x = x * y * (n + 0.5) / (n + 1) * (n + 0.5) / (n + 1.5);
        ++n;
    } while (fabs(x) > 0.0000000000001);
    return M_PI_2 - res;
}