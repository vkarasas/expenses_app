@param java.util.List<com.expenses.dto.CategoryDTO> categories
@param com.expenses.util.CsrfHiddenInput csrfHiddenInput

@template.layout.index(content = @`
    <div class="container">
        <div class="card shadow-sm">
            <!-- Panel Header -->
            <div class="card-header bg-white">
                <h2 class="h5 mb-0 fw-semibold text-dark">
                    New Expense
                </h2>
            </div>
            <!-- Add Expense Form -->
            <form method="post" action="/expenses/save" class="card-body">
                ${csrfHiddenInput}
                <%-- Category  --%>
                <div class="row mb-3 align-items-center">
                    <label for="categoryInput" class="col-sm-3 col-form-label fw-medium">
                        Category
                    </label>
                    <div class="col-sm-9">
                        <select id="categoryInput"
                                name="categoryId"
                                class="form-select"
                        >
                            <option value="">Select category</option>

                            @for (com.expenses.dto.CategoryDTO category : categories)
                                <option value="${category.id()}">
                                    ${category.description()}
                                </option>
                            @endfor
                        </select>
                    </div>
                </div>

                <!-- Date -->
                <div class="row mb-3 align-items-center">
                    <label for="dateInput" class="col-sm-3 col-form-label fw-medium">
                        Date
                    </label>
                    <div class="col-sm-9">
                        <input id="dateInput"
                                type="date"
                                name="date"
                                class="form-control"
                        />
                    </div>
                </div>

                <!-- Description -->
                <div class="row mb-3 align-items-center">
                    <label for="descriptionInput" class="col-sm-3 col-form-label fw-medium">Description</label>
                    <div class="col-sm-9">
                        <input
                                id="descriptionInput"
                                type="text"
                                name="description"
                                required
                                class="form-control"
                        />
                    </div>
                </div>

                <!-- URL -->
                <div class="row mb-3 align-items-center">
                    <label for="urlInput" class="col-sm-3 col-form-label fw-medium">URL</label>
                    <div class="col-sm-9">
                        <input
                                id="urlInput"
                                type="url"
                                name="url"
                                class="form-control"
                        />
                    </div>
                </div>

                <!-- Order Number -->
                <div class="row mb-3 align-items-center">
                    <label for="orderNumberInput" class="col-sm-3 col-form-label fw-medium">Order Number</label>
                    <div class="col-sm-9">
                        <input
                                id="orderNumberInput"
                                type="text"
                                name="orderNumber"
                                class="form-control"
                        />
                    </div>
                </div>

                <!-- Quantity -->
                <div class="row mb-3 align-items-center">
                    <label for="quantityInput" class="col-sm-3 col-form-label fw-medium">Quantity</label>
                    <div class="col-sm-9">
                        <input
                                id="quantityInput"
                                type="number"
                                oninput="onInput()"
                                name="quantity"
                                step="1"
                                required
                                class="form-control"
                        />
                    </div>
                </div>

                <!-- Amount -->
                <div class="row mb-3 align-items-center">
                    <label for="amountInput" class="col-sm-3 col-form-label fw-medium">Amount</label>
                    <div class="col-sm-9">
                        <input
                                id="amountInput"
                                type="number"
                                oninput="onInput()"
                                name="amount"
                                step="0.01"
                                required
                                class="form-control"
                        />
                    </div>
                </div>

                <!-- Total -->
                <div class="row mb-3 align-items-center">
                    <label for="totalAmountInput" class="col-sm-3 col-form-label fw-medium">Total Amount</label>
                    <div class="col-sm-9">
                        <input
                                id="totalAmountInput"
                                type="number"
                                name="totalAmount"
                                step="0.01"
                                required
                                class="form-control"
                        />
                    </div>
                </div>

                <!-- Actions -->
                <div class="row">
                    <div class="col-12">
                        <hr class="mb-3">
                        <div class="d-flex justify-content-end gap-2">
                            <button
                                    type="submit"
                                    class="btn btn-success"
                            >
                                Save
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
`)