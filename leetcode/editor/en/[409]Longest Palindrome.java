//Given a string s which consists of lowercase or uppercase letters, return the 
//length of the longest palindrome that can be built with those letters. 
//
// Letters are case sensitive, for example, "Aa" is not considered a palindrome.
// 
//
// 
// Example 1: 
//
// 
//Input: s = "abccccdd"
//Output: 7
//Explanation: One longest palindrome that can be built is "dccaccd", whose 
//length is 7.
// 
//
// Example 2: 
//
// 
//Input: s = "a"
//Output: 1
//Explanation: The longest palindrome that can be built is "a", whose length is 
//1.
// 
//
// 
// Constraints: 
//
// 
// 1 <= s.length <= 2000 
// s consists of lowercase and/or uppercase English letters only. 
// 
//
// Related Topics Hash Table String Greedy 👍 6340 👎 446


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int longestPalindrome(String s) {
        // Approach 1: HashMap
//        HashMap<Character, Integer> hashMap = new HashMap<>();
//        for (int i = 0; i < s.length(); i++) {
//            hashMap.put(s.charAt(i), hashMap.getOrDefault(s.charAt(i), 0) + 1);
//        }
//        int sum = 0;
//        boolean hasOdd = false;
//        for (int c : hashMap.values()) {
//            sum += (c / 2) * 2;
//            if (sum % 2 == 0 && c % 2 != 0)
//                sum += c - 1;
//                hasOdd = true;
//        }
//        return hasOdd ? sum + 1 : sum;

        //Approach 2: int[]
        int[] arr = new int[128];
        for (char ch : s.toCharArray()) {
            arr[ch]++;
        }
        int sum = 0;
        boolean hasOdd = false;
        for (int i : arr) {
            sum += (i / 2) * 2;
            if (sum % 2 == 0 && i % 2 != 0) {
                hasOdd = true;
            }
        }
        return hasOdd ? sum + 1 : sum;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
