import Foundation

@main
struct Main {

    static func main() throws {
        do {
            try run(command: "pwd")
        } catch {
            print(error.localizedDescription)
        }
    }

    @discardableResult
    private static func run(command: String) throws -> (String, Int32) {
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