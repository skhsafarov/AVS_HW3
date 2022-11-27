#include <stdio.h>
#include <time.h>
void PrintResult(char *outName, double res, clock_t diff)
{
    FILE *out = fopen(outName, "w");
    fprintf(out, "%lf\nELAPSED TIME: %lf s.\n", res, (double)(diff) / CLOCKS_PER_SEC);
    fclose(out);
}
void PrintError(char *mess, char *outName)
{
    FILE *out = fopen(outName, "w");
    fprintf(out, "%s\n", mess);
    fclose(out);
}