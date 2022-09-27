import SwiftUI
import Theme

struct FilterButtonView: View {
    let title: String
    let isFiltered: Bool
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack(spacing: 12) {
                if isFiltered {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 8, height: 8)
                        .foregroundColor(isFiltered ? AssetColors.onSurface.swiftUIColor : AssetColors.white.swiftUIColor)
                }
                Text(title)
                    .foregroundColor(isFiltered ? AssetColors.onSurface.swiftUIColor : AssetColors.white.swiftUIColor)
                    .font(.system(size: 14, weight: .semibold))
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 4, height: 4)
                    .foregroundColor(isFiltered ? AssetColors.onSurface.swiftUIColor : AssetColors.white.swiftUIColor)
            }
            .animation(.linear(duration: 0.2), value: isFiltered)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 20))
            .background(isFiltered ? AssetColors.secondaryContainer.swiftUIColor : AssetColors.background.swiftUIColor
            )
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFiltered ? AssetColors.secondaryContainer.swiftUIColor : AssetColors.white.swiftUIColor, lineWidth: 1)
            )
        }
    }
}

#if DEBUG
struct FilterButton_Previews: PreviewProvider {
    static let action = {}
    static var previews: some View {
        VStack {
            FilterButtonView(title: "Day", isFiltered: false, onTap: action)
            FilterButtonView(title: "Day1", isFiltered: true, onTap: action)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AssetColors.surface.swiftUIColor)
    }
}
#endif
