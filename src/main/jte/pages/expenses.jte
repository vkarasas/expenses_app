@param java.util.List<com.expenses.dto.ExpenseDTO> expenses

@template.layout.index(content = @`
    <div class="max-w-3xl mx-auto p-6">
        <h1 class="text-2xl font-semibold mb-6">Expenses</h1>

        <!-- Categories Table -->
        <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-200 rounded-lg">
                <thead class="bg-gray-100">
                <tr>
                    <th class="px-4 py-2 border text-left w-12">#</th>
                    <th class="px-4 py-2 border text-center w-24">Action</th>
                    <th class="px-4 py-2 border text-center">Category</th>
                    <th class="px-4 py-2 border text-center">Description</th>
                    <th class="px-4 py-2 border text-center">Date</th>
                    <th class="px-4 py-2 border text-center">Total Amount</th>
                </tr>
                </thead>
                <tbody id="categoryTableBody">
                @for (int i = 0; i < expenses.size(); i++)
                    <tr class="hover:bg-gray-50">
                        <td class="px-4 py-2 border text-center">${i + 1}</td> <!-- Row number -->
                        <td class="px-4 py-2 border text-center"></td>
                        <td class="px-4 py-2 border text-center">${expenses.get(i).categoryDescription()}</td>
                        <td class="px-4 py-2 border text-center">${expenses.get(i).description()}</td>
                        <td class="px-4 py-2 border text-center">${expenses.get(i).date().toString()}</td>
                        <td class="px-4 py-2 border text-right">${expenses.get(i).totalAmount()}</td>
                    </tr>
                @endfor
                </tbody>
            </table>
        </div>

    </div>
`)