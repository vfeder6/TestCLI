#if canImport(XcodeProjectPlugin)
import PackagePlugin
import XcodeProjectPlugin

extension TestCLIPlugin: XcodeBuildToolPlugin {

    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        [.buildCommand(
            displayName: "Test CLI",
            executable: try context.tool(named: "TestCLI").path,
            arguments: []
        )]
    }
}
#endif
