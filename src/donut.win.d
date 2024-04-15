//Windows version

module donut.win;

import std.stdio;
import std.string;
import core.stdc.stdlib;
import std.math;
import core.sys.windows.windows;

void main()
{
    double A = 0, B = 0;
    double[] z = new double[1760];
    char[] b = new char[1760];
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    CONSOLE_CURSOR_INFO cursorInfo;
    cursorInfo.dwSize = 100;
    cursorInfo.bVisible = FALSE;
    SetConsoleCursorInfo(hConsole, &cursorInfo);
    for (;;)
    {
        b[] = cast(char) 32;
        z[] = cast(double) 0;
        for (double j = 0; 6.28 > j; j += 0.07)
            for (double i = 0; 6.28 > i; i += 0.02)
            {
                double c = sin(i), d = cos(j), e = sin(A), f = sin(j), g = cos(A), h = d + 2,
                D = 1 / (c * h * e + f * g + 5), l = cos(i), m = cos(B), n = sin(B),
                t = c * h * g - f * e;
                int x = cast(int)(40 + 30 * D * (l * h * m - t * n));
                if (x >= 0 && x < 80) // Check if x is within bounds
                {
                    int y = cast(int)(12 + 15 * D * (l * h * n + t * m));
                    if (y >= 0 && y < 22) // Check if y is within bounds
                    {
                        int o = x + 80 * y;
                        int N = cast(int)(8 * ((f * e - c * d * g) * m - c * d * e - f * g - l * d * n));

                        int stringIndex = N > 0 ? N : 0;
                        if (stringIndex >= 0 && stringIndex < ".-~:;=!*#$@".length)
                        {
                            z[o] = D;
                            b[o] = ".-~:;=!*#$@"[stringIndex];
                        }
                    }
                }
            }
        system("cls");
        for (int k = 0; 1760 > k; k++)
            if (k % 80 != 0)
                putchar(b[k]);
            else
                putchar(10);
        A += 0.04;
        B += 0.02;
    }
}
