//Given two integer arrays nums1 and nums2, return an array of their 
//intersection. Each element in the result must appear as many times as it shows in both 
//arrays and you may return the result in any order. 
//
// 
// Example 1: 
//
// 
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2,2]
// 
//
// Example 2: 
//
// 
//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [4,9]
//Explanation: [9,4] is also accepted.
// 
//
// 
// Constraints: 
//
// 
// 1 <= nums1.length, nums2.length <= 1000 
// 0 <= nums1[i], nums2[i] <= 1000 
// 
//
// 
// Follow up: 
//
// 
// What if the given array is already sorted? How would you optimize your 
//algorithm? 
// What if nums1's size is small compared to nums2's size? Which algorithm is 
//better? 
// What if elements of nums2 are stored on disk, and the memory is limited such 
//that you cannot load all elements into the memory at once? 
// 
//
// Related Topics Array Hash Table Two Pointers Binary Search Sorting 👍 8154 👎
// 1009


//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public int[] intersect(int[] nums1, int[] nums2) {
        // Approach 1:
//        HashMap<Integer, Integer> hashMap = new HashMap<>();
//
//        for (int i = 0; i < nums1.length; i++) {
//            hashMap.put(nums1[i], hashMap.getOrDefault(nums1[i], 0) + 1);
//        }
//
//        List<Integer> result = new ArrayList<>();
//        for (int i = 0; i < nums2.length; i++) {
//            if (hashMap.containsKey(nums2[i]) && hashMap.get(nums2[i]) > 0) {
//                result.add(nums2[i]);
//                hashMap.put(nums2[i], hashMap.get(nums2[i]) - 1);
//            }
//        }
//        return result.stream().mapToInt(i -> i).toArray();

        // Approach 2:
        HashMap<Integer, Integer> hashMap = new HashMap<>();
        for (int i: nums1) {
            hashMap.put(i, hashMap.getOrDefault(i, 0) + 1);
        }

        int[] result = new int[Math.min(nums1.length, nums2.length)];
        int k = 0;
        for (int i : nums2) {
            if (hashMap.getOrDefault(i, 0) > 0) {
                result[k++] = i;
                hashMap.put(i, hashMap.getOrDefault(i, 0) - 1);
            }
        }
        return Arrays.copyOf(result, k);
    }
}
//leetcode submit region end(Prohibit modification and deletion)







