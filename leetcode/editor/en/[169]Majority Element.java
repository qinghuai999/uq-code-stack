//Given an array nums of size n, return the majority element. 
//
// The majority element is the element that appears more than ⌊n / 2⌋ times. 
//You may assume that the majority element always exists in the array. 
//
// 
// Example 1: 
// Input: nums = [3,2,3]
//Output: 3
// 
// Example 2: 
// Input: nums = [2,2,1,1,1,2,2]
//Output: 2
// 
// 
// Constraints: 
//
// 
// n == nums.length 
// 1 <= n <= 5 * 10⁴ 
// -10⁹ <= nums[i] <= 10⁹ 
// The input is generated such that a majority element will exist in the array. 
//
// 
//
// 
//Follow-up: Could you solve the problem in linear time and in 
//O(1) space?
//
// Related Topics Array Hash Table Divide and Conquer Sorting Counting 👍 22320 
//👎 794


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    // Solution 1
//    public int majorityElement(int[] nums) {
//
//        int middleNum = nums.length / 2;
//        HashMap<Integer, Integer> map = new HashMap<>();
//
//        for (int i = 0; i < nums.length; i++) {
//            map.put(nums[i], map.getOrDefault(nums[i], 0) + 1);
//        }
//
//        for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
//            if (entry.getValue() > middleNum) {
//                return entry.getKey();
//            }
//        }
//
//        return 0;
//    }
    // Solution 2
    public int majorityElement(int[] nums) {
        int n = nums.length / 2;

        int count = 0;
        int candidate = 0;
        for (int num: nums) {
            if (count == 0) {
                candidate = num;
            }

            if (num == candidate) {
                count++;
            } else {
                count--;
            }
        }
        return candidate;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
