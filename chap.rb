class PesquisaController < ApplicationController
    # Inicializa um hash vazio para armazenar as respostas
    @@respostas = {}
  
    def index
      # Exibe o formulário de pesquisa para o usuário preencher
    end
  
    def processar_resposta
      nome = params[:nome]
      
      # Verifica se o cliente já respondeu à pesquisa hoje
      if @@respostas.values.any? { |r| r[:nome] == nome && r[:data] == Date.today }
        flash[:alert] = "Desculpe, #{nome}, mas você já respondeu à pesquisa hoje. Obrigado de qualquer forma!"
        redirect_to root_path
      else
        # Gera um código único para o cliente
        codigo = gerar_codigo
  
        # Obtém a resposta do usuário e categoriza com base na escala
        satisfacao = params[:satisfacao].to_i
        case satisfacao
        when 1..3
          categoria = "Ruim"
        when 4..6
          categoria = "Mediano"
        when 7..8
          categoria = "Bom"
        else
          categoria = "Excelente"
        end
  
        # Adiciona a resposta do usuário ao hash de respostas
        @@respostas[codigo] = { nome: nome, satisfacao: satisfacao, categoria: categoria, data: Date.today }
  
        # Exibe uma mensagem de agradecimento e o código único para o usuário
        flash[:notice] = "Obrigado por nos informar sua satisfação, #{nome}! Seu código único de resposta é: #{codigo}"
        redirect_to root_path
      end
    end
  
    def exibir_respostas
      # Exibe as respostas do dia
      @respostas = @@respostas.select { |_, r| r[:data] == Date.today }
    end
  
    private
  
    # Gera um código único para o cliente
    def gerar_codigo
      rand(1000000..9999999).to_s
    end
  end
  Rails.application.routes.draw do
    root 'pesquisa#index'
    post 'processar_resposta', to: 'pesquisa#processar_resposta
    