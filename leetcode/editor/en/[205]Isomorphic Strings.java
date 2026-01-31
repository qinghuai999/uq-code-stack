//Given two strings s and t, determine if they are isomorphic. 
//
// Two strings s and t are isomorphic if the characters in s can be replaced to 
//get t. 
//
// All occurrences of a character must be replaced with another character while 
//preserving the order of characters. No two characters may map to the same 
//character, but a character may map to itself. 
//
// 
// Example 1: 
//
// 
// Input: s = "egg", t = "add" 
// 
//
// Output: true 
//
// Explanation: 
//
// The strings s and t can be made identical by: 
//
// 
// Mapping 'e' to 'a'. 
// Mapping 'g' to 'd'. 
// 
//
// Example 2: 
//
// 
// Input: s = "foo", t = "bar" 
// 
//
// Output: false 
//
// Explanation: 
//
// The strings s and t can not be made identical as 'o' needs to be mapped to 
//both 'a' and 'r'. 
//
// Example 3: 
//
// 
// Input: s = "paper", t = "title" 
// 
//
// Output: true 
//
// 
// Constraints: 
//
// 
// 1 <= s.length <= 5 * 10⁴ 
// t.length == s.length 
// s and t consist of any valid ascii character. 
// 
//
// Related Topics Hash Table String 👍 10369 👎 2270


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public boolean isIsomorphic(String s, String t) {
        // Approach 1: Time complexity is higher O(n²), Space complexity is O(n)
//        HashMap<Character, Character> map = new HashMap<>();
//        for (int i = 0; i < s.length(); i++) {
//            char sc = s.charAt(i);
//            char tc = t.charAt(i);
//            if (map.containsKey(sc)) {
//                if (map.get(sc) != tc) {
//                    return false;
//                }
//            } else if (map.containsValue(tc)) {
//                return false;
//            }
//            map.put(sc, tc);
//        }
//        return true;

        // Approach 2: Time complexity is O(n), Space complexity is O(n)
        HashMap<Character, Integer> smap = new HashMap<>();
        HashMap<Character, Integer> tmap = new HashMap<>();

        for (int i = 0; i < s.length(); i++) {
            if (!smap.containsKey(s.charAt(i))) {
                smap.put(s.charAt(i), i);
            }

            if (!tmap.containsKey(t.charAt(i))) {
                tmap.put(t.charAt(i), i);
            }

            if (!smap.get(s.charAt(i)).equals(tmap.get(t.charAt(i)))){
                return false;
            }
        }

        return true;

    }
}
//leetcode submit region end(Prohibit modification and deletion)
