@param java.util.List<com.expenses.dto.ExpenseDTO> expenses
@param String successMessage

@template.layout.index(content = @`
    <div class="max-w-3xl mx-auto p-6">
        <h1 class="text-2xl font-semibold mb-6">Expenses</h1>

        @if(successMessage != null)
            <div
                    id="successAlert"
                    class="mb-4 flex items-center justify-between rounded bg-green-100 border border-green-300 text-green-800 px-4 py-2"
            >
                <span>${successMessage}</span>

                <button
                        type="button"
                        onclick="document.getElementById('successAlert').remove()"
                        class="ml-4 text-green-800 hover:text-green-900 font-bold"
                        aria-label="Close"
                >
                    ✕
                </button>
            </div>
        @endif

        <div class="max-w-3xl mx-auto p-6">
            <button type="button" onclick="window.location.href='/expenses/new'"
                    class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">New Expense</button>
        </div>

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
                        <td class="px-4 py-2 border text-right">${expenses.get(i).totalAmount().setScale(2, java.math.RoundingMode.HALF_UP)} €</td>
                    </tr>
                @endfor
                </tbody>
            </table>
        </div>

    </div>
    <script>
        function removeAlert() {
            const alert = document.getElementById("successAlert");
            if (alert) alert.remove();
        }

        // Auto-remove after 10 seconds
        setTimeout(removeAlert, 10000);
    </script>
`)