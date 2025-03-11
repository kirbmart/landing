import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="waitlist"
export default class extends Controller {
  static targets = ["form", "email", "userType", "errors", "success", "submitButton"]
  
  connect() {
    // Initialize form validation
    this.setupFormValidation()
  }
  
  setupFormValidation() {
    // Add event listeners for form validation
    if (this.hasEmailTarget) {
      this.emailTarget.addEventListener('blur', this.validateEmail.bind(this))
    }
  }
  
  validateEmail() {
    const email = this.emailTarget.value.trim()
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    
    if (!email) {
      this.showFieldError(this.emailTarget, 'Email is required')
      return false
    } else if (!emailRegex.test(email)) {
      this.showFieldError(this.emailTarget, 'Please enter a valid email address')
      return false
    } else {
      this.clearFieldError(this.emailTarget)
      return true
    }
  }
  
  showFieldError(field, message) {
    // Clear any existing error
    this.clearFieldError(field)
    
    // Add error class to the field
    field.classList.add('border-red-500')
    
    // Create and append error message
    const errorElement = document.createElement('p')
    errorElement.classList.add('text-red-500', 'text-sm', 'mt-1', 'field-error')
    errorElement.textContent = message
    field.parentNode.appendChild(errorElement)
  }
  
  clearFieldError(field) {
    // Remove error class
    field.classList.remove('border-red-500')
    
    // Remove any error messages
    const errorElements = field.parentNode.querySelectorAll('.field-error')
    errorElements.forEach(el => el.remove())
  }
  
  // Handle form submission
  submit(event) {
    event.preventDefault()
    
    // Validate form
    if (!this.validateEmail()) {
      return
    }
    
    // Disable submit button and show loading state
    this.submitButtonTarget.disabled = true
    this.submitButtonTarget.value = "Submitting..."
    
    // Get form data
    const formData = new FormData(this.formTarget)
    
    // Submit form via AJAX
    fetch(this.formTarget.action, {
      method: 'POST',
      body: formData,
      headers: {
        'Accept': 'application/json',
        'X-Requested-With': 'XMLHttpRequest'
      },
      credentials: 'same-origin'
    })
    .then(response => response.json())
    .then(data => {
      if (data.status === 'success') {
        // Redirect to confirmation page
        window.location.href = data.redirect
      } else {
        // Show error message
        this.errorsTarget.textContent = data.errors.join(', ')
        this.errorsTarget.classList.remove('hidden')
        
        // Reset submit button
        this.submitButtonTarget.disabled = false
        this.submitButtonTarget.value = "Join the Waitlist"
      }
    })
    .catch(error => {
      console.error('Error:', error)
      this.errorsTarget.textContent = "An error occurred. Please try again."
      this.errorsTarget.classList.remove('hidden')
      
      // Reset submit button
      this.submitButtonTarget.disabled = false
      this.submitButtonTarget.value = "Join the Waitlist"
    })
  }
}
