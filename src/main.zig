const std = @import("std");
const print  = std.debug.print;
const raylib = @cImport({
    @cInclude("raylib.h");
});
const Color = @import("color.zig");

pub fn main() !void {
    const screen_width = 800;
    const screen_height = 450;

    const stdout = std.io.getStdOut().writer();

    var x: f32 = 100;
    var y: f32 = 100;

    var position = raylib.Vector2 {
        .x = x,
        .y = y
    };

    raylib.InitWindow(screen_width, screen_height, "Puppet://Protocol");
    
    const texture = raylib.LoadTexture("./src/resource/image/demo.png");
    try stdout.print("Texture ID: {d} \n", .{texture.id});

    const fake_te = raylib.LoadTexture("./src/fake.png");
    try stdout.print("Texture ID: {d} \n", .{fake_te.id});

    while (!raylib.WindowShouldClose()) {
        raylib.BeginDrawing();

        raylib.ClearBackground(raylib.RAYWHITE);

        position.x = @floatFromInt(raylib.GetMouseX());
        position.y = @floatFromInt(raylib.GetMouseY());

        raylib.DrawRectangle(100, 100, 50, 50, Color.demo);
        raylib.DrawTextureEx(texture, position, 0, 3, raylib.WHITE);

        raylib.EndDrawing();
    }
    raylib.CloseWindow();
}
