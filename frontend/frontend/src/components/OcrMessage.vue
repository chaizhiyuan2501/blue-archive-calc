<template>
    <div>
        <h1>Message from Backend:</h1>
        <p>{{ message }}</p>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const message = ref('Loading...')

onMounted(async () => {
    try {
        const res = await axios.get(`${import.meta.env.VITE_API_BASE_URL}/`)
        message.value = res.data.message
    } catch (err) {
        message.value = 'Error fetching message'
        console.error(err)
    }
})
</script>