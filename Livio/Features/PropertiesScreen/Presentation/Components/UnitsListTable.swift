import SwiftUI

// MARK: - Unit Model
struct UnitItem: Identifiable {
    let id = UUID()
    let unitNo: String
    let tenant: String
    let status: UnitStatus
    let rent: String
    let action: String
    
    enum UnitStatus: String {
        case occupied = "Occupied"
        case vacant = "Vacant"
        case pending = "Pending"
        
        var textColor: Color {
            switch self {
            case .occupied: return Color(.success600)
            case .vacant: return Color(.error600)
            case .pending: return Color(.primaryButton)
            }
        }
        
        var backgroundColor: Color {
            switch self {
            case .occupied: return Color(.success600.opacity(0.15))
            case .vacant: return Color(.error600.opacity(0.15))
            case .pending: return Color(.primaryButton.opacity(0.15))
            }
        }
    }
}

// MARK: - Main Table Card View
struct UnitsListTable: View {
    private let units: [UnitItem] = [
        UnitItem(unitNo: "A-101", tenant: "Jonathan Miller", status: .occupied, rent: "+₦1,850,000", action: "ellipsis"),
        UnitItem(unitNo: "A-102", tenant: "Sarah Jenkins", status: .occupied, rent: "+₦1,850,000", action: "ellipsis"),
        UnitItem(unitNo: "B-201", tenant: "-", status: .vacant, rent: "+₦1,850,000", action: "ellipsis"),
        UnitItem(unitNo: "B-202", tenant: "Marcus Reed", status: .pending, rent: "+₦1,850,000", action: "ellipsis")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Card Header
            HStack {
                Text("Unit Management")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.gray900)
                
                Spacer()
                
                Button(action: {}) {
                    Label("Add Unit", systemImage: "plus")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.gray900)
                }
            }
            .padding(16)
            
            // Scrollable Table Content for horizontal overflow
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    // Column Headers
                    HStack(spacing: 16) {
                        Text("Unit no.")
                            .frame(width: 70, alignment: .leading)
                        Text("Tenant")
                            .frame(width: 120, alignment: .leading)
                        Text("Status")
                            .frame(width: 90, alignment: .leading)
                        Text("Monthly")
                            .frame(width: 90, alignment: .trailing)
                        Text("Action")
                            .frame(width: 90, alignment: .trailing)
                    }
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.gray600)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 24)
                    .background(.gray100)
                    
                    Divider()
                    
                    // Table Rows
                    ForEach(units) { unit in
                        VStack(spacing: 0) {
                            HStack(spacing: 16) {
                                // Unit No
                                Text(unit.unitNo)
                                    .foregroundStyle(.gray900)
                                    .font(.system(size: 14, weight: .bold))
                                    .lineLimit(2)
                                    .frame(width: 70, alignment: .leading)
                                
                                // Tenant
                                Text(unit.tenant)
                                    .font(.system(size: 13, weight: .regular))
                                    .foregroundStyle(.gray700)
                                    .lineLimit(2)
                                    .frame(width: 120, alignment: .leading)
                                
                                // Status Badge
                                HStack {
                                    Text(unit.status.rawValue)
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(unit.status.textColor)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(
                                            Capsule()
                                                .fill(unit.status.backgroundColor)
                                        )
                                }
                                .frame(width: 90, alignment: .leading)
                                
                                // Rent Amount
                                Text(unit.rent)
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundStyle(.gray800)
                                    .lineLimit(1)
                                    .frame(width: 90, alignment: .trailing)
                                
                                Image(systemName: unit.action)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(.gray900)
                                    .rotationEffect(.degrees(90))
                                    .frame(width: 60, alignment: .trailing)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            
                            Divider()
                        }
                    }
                }
            }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray300, lineWidth: 1)
        )
        .padding(.top, 24)
    }
}

#Preview {
    UnitsListTable()
        .padding()
}
