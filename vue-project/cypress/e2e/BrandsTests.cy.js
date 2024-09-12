describe('Brands Page', () => {
    beforeEach(() => {
        cy.intercept('GET', 'http://localhost:8080/api/brands').as('getBrands');
        cy.intercept('GET', 'http://localhost:8080/api/cars').as('getCars');
        cy.visit('/brands');
    });

    it('should load and display brands', () => {
        cy.wait('@getBrands');
        cy.get('table tbody tr').should('have.length.greaterThan', 0);
        cy.get('table thead th').contains('Nombre');
        cy.get('table thead th').contains('Año');
        cy.get('table thead th').contains('Detalles');
    });

    it('should navigate to brand creation form when the create button is clicked', () => {
        cy.get('button.crear-button').click();
        cy.url().should('include', '/brands/create');
    });
    
    it('should navigate to brand details page when the view button is clicked', () => {
        cy.wait('@getBrands');
        cy.get('button.details-button').first().click();
        cy.url().should('include', '/brands/1'); // Assuming first brand has ID 1
    });
    
    it('should navigate to edit brand page when the edit button is clicked', () => {
        cy.wait('@getBrands');
        cy.get('button.edit-button').first().click();
        cy.url().should('include', '/brands/edit/1'); // Assuming first brand has ID 1
    });


    // it('should show confirmation modal and disable brand when confirmed', () => {
    //     cy.wait('@getBrands');
    //     cy.get('button.delete-button').first().click(); // Click the disable button

    //     // Verify the modal is visible
    //     cy.get('[data-cy=confirmation-modal]').should('be.visible');

    //     // Click the confirm button inside the modal
    //     cy.get('[data-cy=confirmation-modal]').find('[data-cy=confirm-button]').click();

    //     // Wait for the API call to complete
    //     cy.wait('@disableBrand');

    //     // Verify the modal is no longer visible
    //     cy.get('[data-cy=confirmation-modal]').should('not.be.visible');
    // });

    // it('should show confirmation modal and enable brand when confirmed', () => {
    //     cy.wait('@getBrands');
    //     cy.get('button.edit-button').last().click(); // Click the enable button (assuming the last button)
    //     cy.get('[data-cy=confirmation-modal]').should('be.visible');
    //     cy.get('button').contains('Habilitar').click(); // Confirm action
    //     cy.intercept('PUT', 'http://localhost:8080/api/brands/2/enable').as('enableBrand');
    //     cy.wait('@enableBrand');
    //     cy.get('[data-cy=confirmation-modal]').should('not.be.visible');
    //     // Optionally, verify the brand was updated (e.g., by checking the request or page state)
    // });

    // it('should display disabled brands in the disabled brands table', () => {
    //     cy.intercept('GET', 'http://localhost:8080/api/brands', { fixture: 'brands-disabled.json' }).as('getBrandsDisabled');
    //     cy.visit('/brands');
    //     cy.wait('@getBrandsDisabled');
    //     cy.get('h2').contains('Marcas Deshabilitadas');
    //     cy.get('table').contains('tbody tr', 'Disabled Brand');
    // });
    
});
