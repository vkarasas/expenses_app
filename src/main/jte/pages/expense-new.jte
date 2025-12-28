@param java.util.List<com.expenses.dto.CategoryDTO> categories

@template.layout.index(content = @`
    <div class="max-w-6xl mx-auto bg-white rounded-xl shadow-md border border-gray-200">
        <!-- Panel Header -->
        <div class="px-6 py-4 border-b border-gray-200">
            <h2 class="text-lg font-semibold text-gray-800">
                New Expense
            </h2>
        </div>
        <!-- Add Expense Form -->
        <form method="post" action="/expenses/save" onsubmit="save" class="p-6 space-y-5">
            <%-- Category  --%>
            <div class="grid grid-cols-1 sm:grid-cols-3 items-center gap-4">
                <label class="block text-sm font-medium text-gray-700 mb-1">
                    Category
                </label>
                <select
                        name="categoryId"
                        class="sm:col-span-2 rounded-lg border border-gray-300 px-3 py-2 text-sm
               focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                >
                    <option value="">Select category</option>

                    @for (com.expenses.dto.CategoryDTO category : categories)
                        <option value="${category.getId()}">
                            ${category.getDescription()}
                        </option>
                    @endfor
                </select>
            </div>
            <!-- Date -->
            <div class="grid grid-cols-1 sm:grid-cols-3 items-center gap-4">
                <label class="text-sm font-medium text-gray-700">
                    Date
                </label>
                <input
                        type="date"
                        name="date"
                        class="sm:col-span-2 rounded-lg border border-gray-300 px-3 py-2 text-sm
               focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
            </div>
            <!-- Description -->
            <div class="grid grid-cols-1 sm:grid-cols-3 items-center gap-4">
                <label class="text-sm font-medium text-gray-700">Description</label>
                <input
                        id="descriptionInput"
                        type="text"
                        name="description"
                        required
                        class="sm:col-span-2 rounded-lg border border-gray-300 px-3 py-2 text-sm
               focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
            </div>

            <!-- Quantity -->
            <div class="grid grid-cols-1 sm:grid-cols-3 items-center gap-4">
                <label class="text-sm font-medium text-gray-700">Quantity</label>
                <input
                        id="quantityInput"
                        type="number"
                        name="quantity"
                        step="1"
                        required
                        class="sm:col-span-2 rounded-lg border border-gray-300 px-3 py-2 text-sm
               focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
            </div>

            <!-- Amount -->
            <div class="grid grid-cols-1 sm:grid-cols-3 items-center gap-4">
                <label class="text-sm font-medium text-gray-700">Amount</label>
                <input
                        id="amountInput"
                        type="number"
                        name="amount"
                        step="0.01"
                        required
                        class="sm:col-span-2 rounded-lg border border-gray-300 px-3 py-2 text-sm
               focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
            </div>

            <!-- Total -->
            <div class="grid grid-cols-1 sm:grid-cols-3 items-center gap-4">
                <label class="text-sm font-medium text-gray-700">Total Amount</label>
                <input
                        id="totalAmountInput"
                        type="number"
                        name="totalAmount"
                        required
                        class="sm:col-span-2 rounded-lg border border-gray-300 px-3 py-2 text-sm
               focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
            </div>


            <!-- Actions -->
            <div class="flex justify-end gap-3 pt-4 border-t border-gray-200">
<%--                <button--%>
<%--                        type="button"--%>
<%--                        class="px-4 py-2 text-sm rounded-lg border border-gray-300 text-gray-700 hover:bg-gray-50"--%>
<%--                >--%>
<%--                    Cancel--%>
<%--                </button>--%>
                <button
                        type="submit"
                        class="px-4 py-2 text-sm rounded-lg bg-blue-600 text-white hover:bg-blue-700 transition"
                >
                    Save
                </button>
            </div>
        </form>

    </div>
`)