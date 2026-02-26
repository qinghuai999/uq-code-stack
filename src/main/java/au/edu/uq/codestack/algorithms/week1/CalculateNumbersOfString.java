package au.edu.uq.codestack.algorithms.week1;
/**
 * @Author: Kiki Su
 * @CreateDate: 2026-02-26 09:54:07
 * @Description: Switch and Array
 */
public class CalculateNumbersOfString {
    public String nameOf(int value) {
        switch (value) {
            case 1:
                return "One";
            case 2:
                return "Two";
            case 3:
                return "Three";
            case 4:
                return "Four";
            case 5:
                return "Five";
            case 6:
                return "Six";
        }
        return "??";
    }
    public String nameOf1(int value) {
        String[] names = {
                "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"
        };
        if (value > 0 && value < 10) {
            return names[value];
        } else {
            return "??";
        }
    }

    public static void main(String[] args) {
        CalculateNumbersOfString obj = new CalculateNumbersOfString();
        String result = obj.nameOf1(1);
        System.out.println(result);
    }
}

