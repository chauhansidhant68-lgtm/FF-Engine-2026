import Foundation

struct UnityVariableNode {
    var bitSize: UInt32
    var bitAlign: UInt32
    var offset: UInt64
}

class MemoryManager {
    static func calculateTotalSize(node: UnityVariableNode) -> UInt64 {
        // Your exact 2023 logic: if (-1 != offset) return size + offset;
        let size = UInt64(node.bitSize)
        
        // UInt64.max is the Swift equivalent of -1 in memory addressing
        if node.offset != UInt64.max { 
            return size + node.offset
        }
        return size
    }
    
    static func getAlignment(isPacked: Bool, defaultAlign: UInt32) -> UInt32 {
        return isPacked ? 1 : defaultAlign
    }
}
