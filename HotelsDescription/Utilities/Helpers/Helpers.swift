import Foundation

typealias HandlingRouter = (MainRouterProtocol & MainRouterErrorHandlingProtocol)
typealias ScrollConfigurationTuple<Sections: Collection, Rows: Collection> = (sections: Sections, rows: Rows)

