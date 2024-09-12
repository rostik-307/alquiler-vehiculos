describe("Car Page E2E Tests", () => {
  beforeEach(() => {
    cy.visit("/cars"); // Adjust the route based on your actual routing
  });

  it("should load the list of cars", () => {
    // Verify that the cars list is visible
    cy.get("table").should("exist");
    cy.get("tbody tr").should("have.length.greaterThan", 0);
  });



  it("should navigate to create car form", () => {
    // Click on the create button and verify redirection
    cy.get(".crear-button").click();
    cy.url().should("include", "/cars/create");
  });

  it("should open the edit car form when clicking edit", () => {
    // Click on the edit button for the first car
    cy.get(".edit-button:first").click();
    cy.url().should("include", "/cars/edit");
  });

  it("should display delete confirmation modal when deleting a car", () => {
    // Click delete button for the first car
    cy.get(".delete-button:first").click();

    // Modal should be visible
    cy.get(".modal").should("be.visible");
    cy.get(".modal button").contains("Confirm").click();

    // Verify that car was deleted (assuming mock server response or real server behavior)
    // cy.get(".toast-success").should("contain", "Car deleted successfully");	
  });
});
