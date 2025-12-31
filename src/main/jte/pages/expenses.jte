@param java.util.List<com.expenses.dto.ExpenseDTO> expenses
@param String successMessage

@template.layout.index(content = @`
    <div class="max-w-6xl mx-auto bg-white rounded-xl shadow-md border border-gray-200 mt-6">
        <!-- Panel Header -->
        <div class="px-6 py-4 border-b border-gray-200 mb-2">
            <h2 class="text-lg font-semibold text-gray-800">
                Expenses
            </h2>
        </div>

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

        <div class="grid grid-cols-1 sm:grid-cols-1 items-center gap-4 mt-3 ml-6">
            <button type="button" onclick="window.location.href='/expenses/new'"
                    class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 w-fit">New Expense</button>
        </div>

        <!-- Expenses Table -->
        <div class="flex justify-center mt-3 mb-4">
            <!-- Scroll + Border wrapper -->
            <div class="max-h-[500px] overflow-y-auto w-11/12 border-2 border-gray-300 rounded-lg">
                <table class="w-full border-collapse">
                    <thead class="bg-gray-100 sticky top-0 z-10">
                    <tr>
                        <th class="px-4 py-2 border text-left w-12">#</th>
                        <th class="px-4 py-2 border text-center">Category</th>
                        <th class="px-4 py-2 border text-center">Description</th>
                        <th class="px-4 py-2 border text-center">Date</th>
                        <th class="px-4 py-2 border text-center">Total Amount</th>
                        <th class="px-4 py-2 border text-center w-24">Action</th>
                    </tr>
                    </thead>
                    <tbody id="expenseTableBody">
                    @for (int i = 0; i < expenses.size(); i++)
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-2 border text-center">${i + 1}</td> <!-- Row number -->
                            <td class="px-4 py-2 border text-center">${expenses.get(i).categoryDescription()}</td>
                            <td class="px-4 py-2 border text-center">${expenses.get(i).description()}</td>
                            <td class="px-4 py-2 border text-center">${expenses.get(i).date().toString()}</td>
                            <td class="px-4 py-2 border text-right">${expenses.get(i).totalAmount().setScale(2, java.math.RoundingMode.HALF_UP)} €</td>
                            <td class="px-4 py-2 border text-center">
                                <form
                                        method="post"
                                        action="/expenses/delete"
                                        onsubmit="return confirm('Delete this expense?')"
                                >
                                    <input type="hidden" name="id" value="${expenses.get(i).id()}" />
                                    <button class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">
                                        Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    @endfor
                    </tbody>
                </table>
            </div>
        </div>
    </div>
`)