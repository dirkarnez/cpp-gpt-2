#include <iostream>
#include "common.h"
#include "gpt-2.h"

struct gpt_2_params {
    int32_t max_tokens = 32;
    std::string person    = "Santa";
    std::string model_gpt = "models/ggml-gpt-2-117M.bin";
};

int main() {
    std::cout << "Hello World!";
    gpt_2_params params;
    struct gpt2_context * ctx_gpt = gpt2_init(params.model_gpt.c_str());
    gpt2_set_prompt(ctx_gpt, "");

    const std::string k_prompt =
    R"(This is a dialogue between {0} (A) and a person (B). The dialogue so far is:

    B: Hello {0}, how are you?
    A: I'm fine, thank you.
    {1}
    Here is how {0} (A) continues the dialogue:

    A:)";

    std::string prompt_base = gpt2_get_prompt(ctx_gpt);
    std::string text_heard = "hello!";

    const std::vector<gpt_vocab::id> tokens = gpt2_tokenize(ctx_gpt, text_heard.c_str());

    prompt_base += "B: " + text_heard + "\n";

    std::string prompt = ::replace(::replace(k_prompt, "{0}", params.person), "{1}", prompt_base);

    std::string text_to_speak = gpt2_gen_text(ctx_gpt, prompt.c_str(), params.max_tokens);
    //text_to_speak = std::regex_replace(text_to_speak, std::regex("[^a-zA-Z0-9\\.,\\?!\\s\\:\\'\\-]"), "");
    text_to_speak = text_to_speak.substr(0, text_to_speak.find_first_of('\n'));

    std::cout << text_to_speak << std::endl;
    return 0;
}
