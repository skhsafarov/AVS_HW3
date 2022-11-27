#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <getopt.h>
#include <time.h>

extern double ArcCos(double x);
extern void PrintResult(char *outName, double res, clock_t diff);
extern void PrintError(char *mess, char *outName);

int main(int argc, char *argv[])
{
    char *inName = NULL, *outName = NULL;
    int com = 0;
    bool isRand = false;
    while ((com = getopt(argc, argv, "i:o:g")) != -1)
    {
        if (com == 'g')
        {
            isRand = true;
        }
        else if (com == 'i')
        {
            inName = optarg;
        }
        else if (com == 'o')
        {
            outName = optarg;
        }
        else
        {
            PrintError("The option is not correct!", "../out/out.txt");
            return 0;
        }
    }

    if (isRand)
    {
        srand(time(NULL));
        double x = (double)rand() / RAND_MAX * 2.0 - 1.0;
        clock_t start = clock();
        double res = ArcCos(x);
        clock_t end = clock();
        PrintResult(outName, res, end - start);
    }
    else
    {
        FILE *in = fopen(inName, "r");
        if (in == NULL)
        {
            PrintError("Input file does not exist!", outName);
            return 0;
        }
        double x = 0;
        fscanf(in, "%lf", &x);
        fclose(in);
        if (x < -1 || x > 1)
        {
            PrintError("Invalid value! [-1 <= x <= 1]", outName);
            return 0;
        }
        clock_t start = clock();
        double res = ArcCos(x);
        clock_t end = clock();
        PrintResult(outName, res, end - start);
    }

    return 0;
}