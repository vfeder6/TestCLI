import PackagePlugin

@main
struct TestCLIPlugin: BuildToolPlugin {

    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        [.buildCommand(
            displayName: "Test CLI",
            executable: try context.tool(named: "TestCLI").path,
            arguments: []
        )]
    }
}
