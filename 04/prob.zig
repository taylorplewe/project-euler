const std = @import("std");

pub fn main() !void {
    var n1: u32 = 999;
    var n2: u32 = 999;

    var highestPalindrome: u32 = 0;
    var prod1: u32 = 0;
    var prod2: u32 = 0;

    while (n1 > 900) : (n1 -= 1) {
        while (n2 > 900) : (n2 -= 1) {
            if (try isPalindrome(n1 * n2)) {
                if (n1 * n2 > highestPalindrome) {
                    highestPalindrome = n1 * n2;
                    prod1 = n1;
                    prod2 = n2;
                }
            }
        }
        n2 = 999;
    }

    std.debug.print("highest palindrome: {d} n1: {d} n2: {d}\n", .{highestPalindrome, prod1, prod2});
}

fn isPalindrome(num: u32) !bool {
    var buffer: [256]u8 = undefined;
    const str = try std.fmt.bufPrint(&buffer, "{d}", .{num});
    for (str, 0..) |char, i| {
        if (char != str[(str.len-1) - i]) {
            return false;
        }
    }
    return true;
}
