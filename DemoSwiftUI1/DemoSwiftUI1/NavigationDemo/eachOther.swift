//
//  eachOther.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/4.
//

import Foundation
import SwiftUI
import Combine



/// 交互操作
struct eachOtherScene: View {
    
    let personData = PersonStore()
    
    var body: some View {
//        WindowGroup {
//            eachOtherView()
            PersonsView(store: personData)
//        }
    }
}


struct eachOtherView: View {
    /// 被标记为@State, 表示这个属性的变化会引起重新刷新视图
    @State var inputString: String = ""
    
    var body: some View {
        VStack {
            Text(inputString)
                .frame(width: 200, height: 44, alignment: .center)
            InputView(placeholder: "请输入", textString: $inputString)
                .frame(width: 200, height: 44, alignment: .bottom)
        }
        .cornerRadius(8)
        .border(Color.gray)
    }
}

struct InputView: View {
    let placeholder: String
    
    /// @Binding 将 inputString 与 InputView 中的 textString 进行绑定。
    /// 而 InputView 中的输入框又将 InputView 的 textString 与输入的内容进行绑定，
    /// 因此输入框内容变化时, 绑定的eachOtherView.inputString内容会跟着被修改
    @Binding var textString: String
    
    var body: some View {
        TextField(placeholder, text: $textString)
            .font(Font.system(size: 22))
            .padding()
            
    }
}

// MARK:- 第二个例子
// 构建一个显示用户列表并允许我们编辑用户数据的应用程序

struct Person: Identifiable {
    let id: UUID
    var name: String
    var age: Int
}

final class PersonStore: ObservableObject {
    @Published var persons: [Person] = [
        .init(id: .init(), name: "Majid", age: 28),
        .init(id: .init(), name: "John", age: 31),
        .init(id: .init(), name: "Fred", age: 25)
    ]
}

struct PersonsView : View {
    
    /**
      ObservedObject 如果使用它来进行绑定，必须是值类型，也就是必须是枚举或结构体。
     不能在class中使用 EnvironmentObject 或 ObservedObject 里面的状态或条目，这样的绑定是无效的
     Apple 给的绑定的文档中说：“如果Value不是值语义，则未指定使用所得Binding的任何视图的更新行为。”
     */
    @ObservedObject var store: PersonStore

    var body: some View {
        NavigationView {
            List {
                ForEach(store.persons.indexed(), id: \.1.id) { index, person in
                    NavigationLink(destination: EditingView(person: self.$store.persons[index])) {
                        VStack(alignment: .leading) {
                            Text(person.name)
                                .font(.headline)
                            Text("Age: \(person.age)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }.navigationBarTitle(Text("Persons"))
        }
    }
}

struct EditingView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var person: Person

    var body: some View {
        Form {
            Section(header: Text("Personal information")) {
                TextField("type something...", text: $person.name)
                Stepper(value: $person.age) {
                    Text("Age: \(person.age)")
                }
            }

            Section {
                Button("Save") {
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.navigationBarTitle(Text(person.name))
    }
}

extension Sequence {
    func indexed() -> Array<(offset: Int, element: Element)> {
        return Array(enumerated())
    }
}


// MARK:- 第三个示例 计算绑定

typealias Reducer<State, Action> = (inout State, Action) -> Void

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    private let reducerLet: Reducer<State, Action>

    init(initialState: State, reducer: @escaping Reducer<State, Action>) {
        self.state = initialState
        self.reducerLet = reducer
    }

    func send(_ action: Action) {
        reducerLet(&state, action)
    }
}

extension Store {
    func binding<Value>(
        for keyPath: KeyPath<State, Value>,
        transform: @escaping (Value) -> Action
    ) -> Binding<Value> {
        Binding<Value>(
            get: { self.state[keyPath: keyPath] },
            set: { self.send(transform($0)) }
        )
    }
}



struct ExampleView: View {
    var body: some View {
        TextField("type something...", text: Binding.constant("Hello!"))
    }
}

/*
 因此, 数据的传输流为:
 
 TextField输入 -> InputView.textString -> eachOtherView.inputString -> eachOtherView.VStack.Text
 
 当自定义视图的数据需要外部传入的时候， 使用普通的属性

 当自定义的视图需要通过数据变化更新视图时， 对普通属性加上@State修饰

 当自定义的视图需要将视图的变化表现在数据的变化时，对普通属性加上@Binding修饰, @Binding 包含了@State的功能, 但一般不会去对@Binding属性做修改
 
 */


/*
 绑定
 @State
 @Binding
 
 绑定用于控制应用程序中的数据流，它为我们提供了类似于访问值类型的参考。
 
 绑定是一种属性包装器类型，可以读取和写入数值。
 在swiftUI中我们的数据来源有以下几种：
 EnvironmentObject、ObservedObject、State
 
 State: 绑定值的状态，其属性的修饰官方推荐使用 private
 // 定义
 @State private var textString = "Hello World"
 // 使用 => 即绑定
 TextField("请输入", text: $textString)
 TextField 需要一个文本值的绑定，我们使用$符号访问状态属性包装器的预计值，该值是对属性包装器值的绑定。
 
 
 https://www.jianshu.com/p/53bcf1194204
 
 @binding 双向绑定
 用于父子视图的双向传递，修改子视图的Binding值，会触发父视图的State改变重新渲染body中的数据。
 修改父视图的State的值同样也会重新通过Binding传递给子视图，触发重新渲染body中的数据。
 
 @State private var num: Int = 0;
 
 var body: some View {
    VStack {
        // 添加一个 $ 前缀， 就可以将 State 转为 Binding
        Stepper("计算器", valu: $num).padding(50)
        
        // self.$num.wrarppedValue 的用法
        // Binding 对象是一个 Binding 类型的变量，
        // 当只需要使用值的时候，需要访问其 .warppedValue 属性来访问里面包裹的值
        Text("\(self.$num.wrarppedValue)") // self.num
    }
 }
 */
