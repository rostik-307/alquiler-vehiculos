<template>
    <div v-if="show" class="modal-overlay">
        <div class="modal">
            <h3>Confirmar Eliminación</h3>
            <p>¿Estás seguro de que quieres eliminar?</p>
            <div class="modal-actions">
                <button class="delete-button" @click="confirmDelete">Eliminar</button>
                <button class="edit-button" @click="cancelDelete">Cancelar</button>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'DeleteConfirmationModal',
    props: {
        show: Boolean
    },
    emits: ['confirm', 'cancel'],
    methods: {
        confirmDelete() {
            this.$emit('confirm');
        },
        cancelDelete() {
            this.$emit('cancel');
        }
    }
};
</script>

<style scoped>
.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
}

.modal {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
}

.modal-actions {
    margin-top: 20px;
}

button {
    margin: 0 10px;
    padding: 10px 20px;
    cursor: pointer;
}
</style>