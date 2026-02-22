//Given a string s, reverse only all the vowels in the string and return it. 
//
// The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both 
//lower and upper cases, more than once. 
//
// 
// Example 1: 
//
// 
// Input: s = "IceCreAm" 
// 
//
// Output: "AceCreIm" 
//
// Explanation: 
//
// The vowels in s are ['I', 'e', 'e', 'A']. On reversing the vowels, s becomes 
//"AceCreIm". 
//
// Example 2: 
//
// 
// Input: s = "leetcode" 
// 
//
// Output: "leotcede" 
//
// 
// Constraints: 
//
// 
// 1 <= s.length <= 3 * 10⁵ 
// s consist of printable ASCII characters. 
// 
//
// Related Topics Two Pointers String 👍 5312 👎 2857


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public String reverseVowels(String s) {
        int leftInx = 0;
        int rightInx = s.length() - 1;
        String vowel = "aeiouAEIOU";
        char[] arr = s.toCharArray();

        while (leftInx < rightInx) {
            char left = arr[leftInx];
            char right = arr[rightInx];

            if (vowel.indexOf(left) == -1) {
                leftInx++;
                continue;
            }
            if (vowel.indexOf(right) == -1) {
                rightInx--;
                continue;
            }

            char temp = arr[leftInx];
            arr[leftInx] = arr[rightInx];
            arr[rightInx] = temp;
            leftInx++;
            rightInx--;
        }
        return new String(arr);
    }
}
//leetcode submit region end(Prohibit modification and deletion)
