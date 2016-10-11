// GLOBALS
cbuffer MatrixBuffer
{
	matrix worldMatrix;
	matrix viewMatrix;
	matrix projectionMatrix;
};

// TYPEDEFS
struct VertexInputType
{
	float4 position : POSITION;
	float2 tex : TEXCOORD0;
	float3 normal : NORMAL;
};

struct PixelInputType
{
	float4 position : SV_POSITION;
	float2 tex : TEXCOORD0;
	float3 normal : NORMAL;
};

// Vertex Shader
PixelInputType LightVertexShader(VertexInputType input)
{
	PixelInputType output;

	input.position.w = 1.0f;

	input.position = mul(input.position, worldMatrix);
	input.position = mul(output.position, viewMatrix);
	input.position = mul(output.position, projectionMatrix);

	output.tex = input.tex;

	output.normal = mul(input.position, (float3x3)worldMatrix);

	output.normal = normalize(output.normal);

	return output;
}