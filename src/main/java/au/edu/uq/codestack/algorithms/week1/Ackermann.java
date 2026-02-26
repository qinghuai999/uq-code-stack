package au.edu.uq.codestack.algorithms.week1;

/**
 * @Author: Kiki Su
 * @CreateDate: 2026-02-26 10:03:57
 * @Description: This class provides an implementation of the Ackermann Peter
 *               function, a classic example of a highly recursive
 *               mathematical.
 *
 *               The function is defined as:
 *               A(0, n) = n + 1
 *               A(m, 0) = A(m - 1, 1), for m > 0
 *               A(m , n) = A(m - 1, A(m, n - 1)) for m, n > 0
 */
public class Ackermann {
    public static long ackermann(int m, int n) {
        if (m == 0) {
            return n + 1;
        } else if (m > 0 && n == 0) {
            return ackermann((m - 1), 1);
        } else {
            return ackermann((m - 1), (int)ackermann(m, (n - 1)));
        }
    }

    public static void main(String[] args) {
        System.out.println(ackermann(0, 3));
        System.out.println(ackermann(3, 4));
        System.out.println(ackermann(4, 1));
    }
}
