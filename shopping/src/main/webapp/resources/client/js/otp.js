const inputs = document.querySelectorAll(".otp-field > input");
const button = document.querySelector(".btn");
const otpHiddenInput = document.getElementById("otpHidden");

window.addEventListener("load", () => inputs[0].focus());
button.setAttribute("disabled", "disabled");

inputs[0].addEventListener("paste", function (event) {
  event.preventDefault();

  const pastedValue = (event.clipboardData || window.clipboardData).getData(
    "text"
  );
  const otpLength = inputs.length;

  for (let i = 0; i < otpLength; i++) {
    if (i < pastedValue.length) {
      inputs[i].value = pastedValue[i];
      inputs[i].removeAttribute("disabled");
      inputs[i].focus();
    } else {
      inputs[i].value = ""; // Clear any remaining inputs
      inputs[i].focus();
    }
  }
});

inputs.forEach((input, index1) => {
  input.addEventListener("keyup", (e) => {
    const currentInput = input;
    const nextInput = input.nextElementSibling;
    const prevInput = input.previousElementSibling;

    if (currentInput.value.length > 1) {
      currentInput.value = "";
      return;
    }

    if (
      nextInput &&
      nextInput.hasAttribute("disabled") &&
      currentInput.value !== ""
    ) {
      nextInput.removeAttribute("disabled");
      nextInput.focus();
    }

    if (e.key === "Backspace") {
      inputs.forEach((input, index2) => {
        if (index1 <= index2 && prevInput) {
          input.setAttribute("disabled", true);
          input.value = "";
          prevInput.focus();
        }
      });
    }

    button.classList.remove("active");
    button.setAttribute("disabled", "disabled");

    const allFilled = Array.from(inputs).every(input => input.value !== "");
    if (allFilled) {
      button.classList.add("active");
      button.removeAttribute("disabled");
    }
  });
});

button.addEventListener("click", () => {
  const otp = Array.from(inputs)
    .map(input => input.value)
    .join('');
  otpHiddenInput.value = otp;
});