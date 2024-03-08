import ArgumentParser
import Foundation

@main
struct Main: ParsableCommand {

    public func run() throws {
        let command = try run(command: "pwd")
        print(command.0)
        print(command.1)
        let command2 = try run(command: "ls -la")
        print(command2.0)
        print(command2.1)
    }

    @discardableResult
    private func run(command: String) throws -> (String, Int32) {
        let task = Process()
        let pipe = Pipe()

        task.standardOutput = pipe
        task.standardError = pipe
        task.arguments = ["--login", "-c", command]
        task.executableURL = URL(fileURLWithPath: "/bin/zsh")
        task.standardInput = nil

        try task.run()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!

        task.waitUntilExit()

        return (output, task.terminationStatus)
    }
}
