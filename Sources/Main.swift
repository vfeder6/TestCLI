import ArgumentParser
import Foundation

@main
struct Main: ParsableCommand {

    public func run() throws {
        print("THIOKANEEEEE")
        print(FileManager().currentDirectoryPath)
    }
}
