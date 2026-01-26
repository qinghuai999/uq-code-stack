//Given two binary strings a and b, return their sum as a binary string. 
//
// 
// Example 1: 
// Input: a = "11", b = "1"
//Output: "100"
// 
// Example 2: 
// Input: a = "1010", b = "1011"
//Output: "10101"
// 
// 
// Constraints: 
//
// 
// 1 <= a.length, b.length <= 10⁴ 
// a and b consist only of '0' or '1' characters. 
// Each string does not contain leading zeros except for the zero itself. 
// 
//
// Related Topics Math String Bit Manipulation Simulation 👍 10375 👎 1091


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public String addBinary(String a, String b) {
        StringBuilder s = new StringBuilder();

        int i = a.length() - 1;
        int j = b.length() - 1;
        int carry = 0;

        while (i >= 0 || j >= 0 || carry == 1) {
            if(i >= 0) carry += a.charAt(i--) - '0';
            if(j >= 0) carry += b.charAt(j--) - '0';
            s.append(carry % 2);
            carry /= 2;
        }
        return s.reverse().toString();
    }
}
//leetcode submit region end(Prohibit modification and deletion)
