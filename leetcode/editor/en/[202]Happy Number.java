//Write an algorithm to determine if a number n is happy. 
//
// A happy number is a number defined by the following process: 
//
// 
// Starting with any positive integer, replace the number by the sum of the 
//squares of its digits. 
// Repeat the process until the number equals 1 (where it will stay), or it 
//loops endlessly in a cycle which does not include 1. 
// Those numbers for which this process ends in 1 are happy. 
// 
//
// Return true if n is a happy number, and false if not. 
//
// 
// Example 1: 
//
// 
//Input: n = 19
//Output: true
//Explanation:
//1² + 9² = 82
//8² + 2² = 68
//6² + 8² = 100
//1² + 0² + 0² = 1
// 
//
// Example 2: 
//
// 
//Input: n = 2
//Output: false
// 
//
// 
// Constraints: 
//
// 
// 1 <= n <= 2³¹ - 1 
// 
//
// Related Topics Hash Table Math Two Pointers 👍 11753 👎 1625


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
//    public boolean isHappy(int n) {
//
//        Set<Integer> list = new HashSet<>();
//        while (n != 1 && !list.contains(n)) {
//            list.add(n);
//            n = next(n);
//        }
//        return n == 1;
//    }
//    // 2345 -> 5*5, + 4*4, + 3*3, + 2*2
//    private int next(int n) {
//        int sum = 0;
//        while (n > 0) {
//            int digit = n % 10;
//            sum += digit * digit;
//            n /= 10;
//        }
//        return sum;
//    }
public boolean isHappy(int n) {
    int slow = n;
    int fast = next(n);

    while (fast != 1 && slow != fast) {
        slow = next(slow);
        fast = next(next(fast));
    }

    return fast == 1;
}
    // 2345 -> 5*5, + 4*4, + 3*3, + 2*2
    private int next(int n) {
        int sum = 0;
        while (n > 0) {
            int digit = n % 10;
            sum += digit * digit;
            n /= 10;
        }
        return sum;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
