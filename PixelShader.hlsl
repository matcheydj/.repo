//unlicensed code by matcheydj
//key:
//comment
//*default
///:
//*float4 main() : SV_TARGET
//*{
//*	return float4(1.0f, 1.0f, 1.0f, 1.0f);
//*}
// example section
// float fVar;
// float fVar = 3.1f;
// float iVar[3];
// int iVar[3] = { 1,2,3 };
// //float4 color;
// //uniform float4 position : POSITION;
// //const float4 lightDirection = { 0,0,1 };
// example section ends
//
float4 main() : SV_TARGET
{
	return float4 color;
uniform float4 position : POSITION;
const float4 lightDirection = { 0,1,1 };
}
//
float3 main() : NORMAL;
{ vector vClr;
struct vInput {
    float4 position : POSITION;
    float3 vNormal : NORMAL;
    float4 vBlendWeight : BLENDWEIGHT;
};
struct vOutput {
    float4 position : POSITION;
    float4 vDiffuse : COLOR;
};
//
float4x4 mWld1;
float4x4 mWld2;
float4x4 mWld3;
float4x4 mWld4;
//
float Len;
float4 vLight;
//
float4x4 mTot;
//
ex_vOutput_vs_vInput(const vInput v, uniform float len = 100)
{
    vOutput out;
    // skin position to world
    float3 vPosition =
        mul(v.vPosition, (float4x3) mWld1) * v.vBlendWeight.x +
        mul(v.vPosition, (float4x3) mWld2) * v.vBlendWeight.y +
        mul(v.vPosition, (float4x3) mWld3) * v.vBlendWeight.z +
        mul(v.vPosition, (float4x3) mWld4) * v.vBlendWeight.w;
    // skin normal to world
    float3 vNormal =
        mul(v.vNormal, (float3x3) mWld1) * v.vBlendWeights.x +
        mul(v.vNormal, (float3x3) mWld2) * v.vBlendWeights.y +
        mul(v.vNormal, (float3x3) mWld3) * v.vBlendWeights.z +
        mul(v.vNormal, (float3x3) mWld4) * v.vBlendWeights.w;
    // output
    out.vPosition = mul(float4(vPosition + vNormal * Len, 1), mTot);
    out.vDiffuse = dot(vLight, vNormal);
    //
    return out;
}