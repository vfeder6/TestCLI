import ArgumentParser

@main
struct TestCLI: ParsableCommand {

    func run() throws {
        print("It works!")
    }
}
