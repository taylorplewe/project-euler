const std = @import("std");

pub fn main() void {
    comptime var nth = 6;
    comptime var prime = 17;
    inline while (nth < 10_001) : (prime += 2) {
        if (isPrime(prime)) nth += 1;
    }

    std.debug.print("{d}th prime: {d}\n", .{nth, prime - 2});
}

fn isPrime(comptime num: usize) bool {
    //const sqrt = std.math.sqrt(num);
    const sqrt = @sqrt(num);
    inline for (3..sqrt+1) |div| {
        if (num % div == 0) return false;
    }
    return true;
}
