//Given a non-empty array of integers nums, every element appears twice except 
//for one. Find that single one. 
//
// You must implement a solution with a linear runtime complexity and use only 
//constant extra space. 
//
// 
// Example 1: 
//
// 
// Input: nums = [2,2,1] 
// 
//
// Output: 1 
//
// Example 2: 
//
// 
// Input: nums = [4,1,2,1,2] 
// 
//
// Output: 4 
//
// Example 3: 
//
// 
// Input: nums = [1] 
// 
//
// Output: 1 
//
// 
// Constraints: 
//
// 
// 1 <= nums.length <= 3 * 10⁴ 
// -3 * 10⁴ <= nums[i] <= 3 * 10⁴ 
// Each element in the array appears twice except for one element which appears 
//only once. 
// 
//
// Related Topics Array Bit Manipulation 👍 18601 👎 885


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int singleNumber(int[] nums) {
        // Approach 1: Not effecient
//        if (nums.length == 1) {
//            return nums[0];
//        }
//
//        HashMap<Integer, Integer> hashMap = new HashMap<>();
//
//        for (int i = 0; i < nums.length; i++) {
//            hashMap.put(nums[i], hashMap.getOrDefault(nums[i], 0) + 1);
//        }
//
//        for (int i: hashMap.keySet()) {
//            if (hashMap.get(i) == 1) {
//                return i;
//            }
//        }
//        return 0;

        // Approach 2: XOR
        int ans = 0;
        for (int i = 0; i < nums.length; i++) {
            ans ^= nums[i];
        }
        return ans;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
