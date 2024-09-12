<template>
    <div v-if="show" class="modal-overlay">
        <div class="modal">
            <h3>{{ title }}</h3>
            <p>{{ message }}</p>
            <div class="modal-actions">
                <button class="delete-button" @click="confirmAction">{{ confirmButtonLabel }}</button>
                <button class="details-button" @click="cancelAction">Cancelar</button>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'DeleteConfirmationModal',
    props: {
        show: Boolean,
        title: {
            type: String,
            default: 'Confirmar Acción'
        },
        message: {
            type: String,
            default: '¿Estás seguro de que quieres realizar esta acción?'
        },
        confirmButtonLabel: {
            type: String,
            default: 'Confirmar'
        }
    },
    emits: ['confirm', 'cancel'],
    methods: {
        confirmAction() {
            this.$emit('confirm');
        },
        cancelAction() {
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


</style>
