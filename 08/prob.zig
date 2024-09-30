const std = @import("std");
const isDigit = std.ascii.isDigit;

pub fn main() !void {
    const file = try std.fs.cwd().openFile("nums.txt", .{});
    defer file.close();

    var buf: [1024]u8 = undefined;
    _ = try file.readAll(&buf);

    var prod: u64 = 1;
    var zeroes: u32 = 0;

    for (buf[0..13]) |char| {
        const n = intFromChar(char);
        if (n == 0) {
            zeroes += 1;
        } else {
            prod *= n;
        }
    }
    var highestProd: u64 = prod;
    var highestInd: u32 = 0;
    for (buf[13..], buf[0..buf.len-13], 1..) |char, prevChar, ind| {
        if (!std.ascii.isDigit(char)) {
            std.debug.print("bailing at {d}\n", .{ind + 13});
            break;
        }
        const lastNum = intFromChar(prevChar);
        const nextNum = intFromChar(char);
        if (lastNum == 0) {
            zeroes -= 1;
        } else {
            prod /= lastNum;
        }
        if (nextNum == 0) {
            zeroes += 1;
        } else {
            prod *= nextNum;
        }
        if (zeroes == 0 and prod > highestProd) {
            highestProd = prod;
            highestInd = @intCast(ind);
        }
    }
    std.debug.print("highest prod: {d}\nind: {d}\n", .{highestProd, highestInd});
}

fn intFromChar(char: u8) u8 {
    return char - '0';
}
